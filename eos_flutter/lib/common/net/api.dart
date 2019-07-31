import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eos_flutter/common/model/eos_error.dart';
import 'package:eos_flutter/common/net/result_data.dart';

import 'code.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/response_interceptor.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  var _dio = new Dio();

  HttpManager() {
    _dio.interceptors
      ..add(HeadInterceptors())
      ..add(LogsInterceptors())
      ..add(ErrorInterceptors(_dio))
      ..add(ResponseInterceptor());
  }

  netFetch(path,
      {params,
      Map<String, dynamic> header,
      Options options,
      noTip = false}) async {
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (options != null) {
      options.headers = headers;
    } else {
      //默认get请求
      options = Options(method: "get");
      options.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      var errorMessage = e.message;

      ///网络错误
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_ERROR;
      }
      else if (e.type == DioErrorType.RESPONSE) {
        try {
          ///针对eos,提取eos错误里面的异常信息
          var eosError = EosError.fromJson(errorResponse.data);
          errorResponse.statusCode = eosError.code;
          errorMessage = eosError.error.details[0].message;
        } catch (e) {
        }
      }
      return ResultData(errorMessage, false, errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio.request(path, data: params, options: options);
    } on DioError catch (e) {
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();

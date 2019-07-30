import 'package:dio/dio.dart';

import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/response_interceptor.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  var dio = new Dio();

  HttpManager() {
    dio.interceptors
      ..add(LogsInterceptors())
      ..add(HeadInterceptors())
      ..add(ErrorInterceptors(dio))
      ..add(ResponseInterceptor());
  }
}

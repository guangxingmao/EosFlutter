import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio dio;

  ErrorInterceptors(this.dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return dio.resolve(new ResultData(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", false), false,
          Code.NETWORK_ERROR));
    }
    return options;
  }
}

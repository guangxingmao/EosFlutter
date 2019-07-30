import 'package:dio/dio.dart';

class HeadInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    /// 超时
    options.connectTimeout = 15000;

    return options;
  }
}

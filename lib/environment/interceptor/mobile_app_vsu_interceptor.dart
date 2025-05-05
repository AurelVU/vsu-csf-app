import 'package:dio/dio.dart';

class MobileAppVSUInterceptor extends Interceptor {
  MobileAppVSUInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Fittin-MobileApp-VSU'] = 2024040100;
    return super.onRequest(options, handler);
  }
}

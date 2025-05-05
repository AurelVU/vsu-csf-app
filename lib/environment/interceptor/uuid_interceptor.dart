import 'package:dio/dio.dart';

import '../../di/uuid_configurator.dart';

class UUIDInterceptor extends Interceptor {
  UUIDInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-ID'] = UUIDConfigurator.uuid;
    return super.onRequest(options, handler);
  }
}

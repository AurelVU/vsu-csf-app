import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fkn/environment/config/environment.dart';

import '../environment/interceptor/platform_interceptor.dart';

void initDio({
  Iterable<Interceptor>? additionalInterceptors,
  Environment? environment,
  required Dio dio,
}) {
  const timeout = Duration(seconds: 30);

  dio.options
    ..baseUrl = environment?.config.baseUrl ?? ''
    ..connectTimeout = timeout
    ..receiveTimeout = timeout
    ..contentType = 'application/json'
    ..sendTimeout = timeout;

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    HttpClient client = HttpClient();
    final proxyUrl = environment?.config.proxyProdUrl ?? '';
    if (proxyUrl.isNotEmpty) {
      client
        ..findProxy = (uri) {
          return 'PROXY $proxyUrl';
        }
        ..badCertificateCallback = (_, __, ___) {
          return true;
        };
    }
    return client;
  };

  if (additionalInterceptors != null) {
    dio.interceptors.addAll(additionalInterceptors);
  }

  dio.interceptors.add(PlatformInterceptor());



}

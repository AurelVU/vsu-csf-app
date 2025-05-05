import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fkn/domain/event/navigation_event.dart';
import 'package:fkn/domain/event/snack_event.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/router/routes.dart';
import 'package:fkn/router/routes_name.dart';

class TimeoutInterceptor extends Interceptor {
  TimeoutInterceptor(
    this._eventBus,
    this._dio,
  );

  final IEventBus _eventBus;
  final Dio _dio;

  bool isTimeout(DioExceptionType errorType) =>
      errorType == DioExceptionType.connectionTimeout ||
      errorType == DioExceptionType.receiveTimeout ||
      errorType == DioExceptionType.sendTimeout;

  bool isLostConnection(DioException error) {
    return error.type == DioExceptionType.connectionError && (error.message ?? '').startsWith('The connection');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (isLostConnection(err)) {
      _eventBus.addEvent(
        NamedNavigationEvent(
          name: RoutesNames.noNetwork,
          route: Routes.noNetwork,
        ),
      );
      await Connectivity().onConnectivityChanged.firstWhere(
        (result) {
          return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
        },
      );
      final response = await _retry(err.requestOptions);
      return handler.resolve(response);
    } else if (isTimeout(err.type)) {
      _eventBus.addEvent(
        SnackBarEvent(
          name: 'NetworkError',
          message: 'Время ожидания ответа от сервера истекло',
        ),
      );
    } else {
      super.onError(err, handler);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

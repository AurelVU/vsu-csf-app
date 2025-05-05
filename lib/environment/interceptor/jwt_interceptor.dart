import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mutex/mutex.dart';
import 'dart:io';

import '../../feature/student/profile/profile_manager.dart';

/// Interceptor for working with JWT tokens, updating and saving them.
/// Requires [Dio] to work.

class JWTInterceptor extends Interceptor {
  /// Create instance of [JWTInterceptor].
  JWTInterceptor({
    required Dio dio,
    required IProfile profile,
    bool useCaching = true,
    List<String> authUrls = const [
      '/auth/phone/part2',
      '/auth/token/free',
      '/auth/social/',
      '/auth/phone/part2',
      '/auth/email/part2',
      '/auth/inn/inn',
      '/auth/login',
    ],
    uncheckedUrls = const ['/properties/time'],
    String refreshUrl = '/auth/token/refresh',
    String freeTokenUrl = '/auth/token/free',
    String freeTokenAuthToken = 'YXBwOmZpdHRpbmFwcA==',
    FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  })  : _dio = dio,
        _useCaching = useCaching,
        _authUrls = authUrls,
        _refreshUrl = refreshUrl,
        _freeTokenUrl = freeTokenUrl,
        _freeTokenBasicToken = freeTokenAuthToken,
        _profile = profile,
        _storage = storage,
        _uncheckedUrls = uncheckedUrls;

  /// Getting tokens from cache.
  Future<void> initTokens() async {
    try {


      _accessToken = await _storage.read(key: 'accessToken');
      _refreshToken = await _storage.read(key: 'refreshToken');
      if (_accessToken == null || _refreshToken == null) {
        await _profile.updateFreeToken();
      }
    } catch (e) {}
  }

  /// Tokens mutex.
  final mutex = Mutex();

  /// Http client.
  final Dio _dio;

  /// JWT token.
  String? _accessToken;

  /// JWT refresh token.
  String? _refreshToken;

  /// Url for refresh request.
  final String _refreshUrl;

  /// Url for free token request.
  final String _freeTokenUrl;

  /// Token for free token basic authorization.
  final String _freeTokenBasicToken;

  /// Urls with tokens in response.
  final List<String> _authUrls;

  /// Black list for checking JWT time on request
  final List<String> _uncheckedUrls;

  /// Profile module
  final IProfile _profile;

  /// Client for working with cache.
  final FlutterSecureStorage _storage;

  /// Use to enable/disable token caching. Default value is true
  final bool _useCaching;

  /// Add JWT authorization token to any request, if available.
  @override
  Future<void> onRequest(options, handler) async {
    // Проверка перед запросом что токен не умер, чтобы сократить количетсов
    // запросов к бекенду. Может создавать дедлок в случае, когда в
    // _uncheckedUrls не указаны урлы, требуемые при запросе к free_token или
    // к refresh_token
    if (_accessToken != null) {
      if (options.path != _refreshUrl &&
          options.path != _freeTokenUrl &&
          !_uncheckedUrls.contains(options.path) &&
          options.uri.host == Uri.parse(_dio.options.baseUrl).host) {
        await mutex.protect(() async {
          if (_getExpDateTime(_accessToken!).compareTo(DateTime.now()) == -1) {
            if (_getExpDateTime(_refreshToken!).compareTo(DateTime.now()) ==
                -1) {
              await _profile.updateFreeToken();
            } else {
              await _refresh();
            }
          }
        });
      }

      options.headers['Authorization'] = 'Bearer $_accessToken';
    }

    if (options.path == _freeTokenUrl) {
      options.headers['Authorization'] = 'Basic $_freeTokenBasicToken';
    }

    return super.onRequest(options, handler);
  }

  /// Save tokens received after authorization.
  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (_authUrls.contains(response.requestOptions.path)) {
      await _saveTokens(
        accessToken: response.data['access_token'],
        refreshToken: response.data['refresh_token'],
      );
    }
    super.onResponse(response, handler);
  }

  /// Update JWT token if it is outdated.
  @override
  Future<void> onError(error, handler) async {
    try {
      if (error.response?.statusCode == 401 &&
          error.requestOptions.path != _refreshUrl) {
        await mutex.protect(() async {
          if (_refreshToken != null) {
            if (_getIncDateTime(_refreshToken!)
                .compareTo(_getResponseDateTime(error.response!.headers)) ==
                -1) {
              await _refresh();
            }
          } else {
            await _profile.updateFreeToken();
          }
        });
        final response = await _retry(error.requestOptions);
        return handler.resolve(response);
      }
    } catch (_) {
      return handler.reject(error);
    }
    return handler.next(error);
  }

  DateTime _getIncDateTime(String token) {
    return DateTime.fromMillisecondsSinceEpoch(json.decode(utf8
        .fuse(base64Url)
        .decode(base64.normalize(token.split('.')[1])))['iat'] *
        1000);
  }

  DateTime _getExpDateTime(String token) {
    return DateTime.fromMillisecondsSinceEpoch(json.decode(utf8
        .fuse(base64Url)
        .decode(base64.normalize(token.split('.')[1])))['exp'] *
        1000);
  }

  DateTime _getResponseDateTime(Headers headers) {
    try {
      return HttpDate.parse(headers['date']!.join(','));
    } catch (_) {
      return DateTime.parse(headers['date']!.join(','));
    }
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    if (_useCaching) {
      await _storage.write(key: 'accessToken', value: null);
      await _storage.write(key: 'refreshToken', value: null);
    }
  }

  /// Make a request to update the JWT token and save it to cache.
  Future<void> _refresh() async {
    Response<dynamic>? response = await _dio.post(
      _refreshUrl,
      data: {'refresh_token': _refreshToken},
      options: Options(
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      await _saveTokens(
        accessToken: response.data['access_token'],
        refreshToken: response.data['refresh_token'],
      );
    } else {
      await _profile.updateFreeToken();
    }
  }

  /// Repeat the failed request.
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

  /// Save tokens and cache them.
  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    if (_useCaching) {
      await _storage.write(key: 'accessToken', value: accessToken);
      await _storage.write(key: 'refreshToken', value: refreshToken);
    }
  }
}

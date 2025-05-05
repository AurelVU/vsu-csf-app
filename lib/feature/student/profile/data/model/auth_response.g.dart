// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      authUrl: json['auth_url'] as String?,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) {
  final val = <String, dynamic>{
    'access_token': instance.accessToken,
    'refresh_token': instance.refreshToken,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auth_url', instance.authUrl);
  return val;
}

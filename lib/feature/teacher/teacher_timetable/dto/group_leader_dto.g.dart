// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_leader_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GroupLeaderDtoToJson(GroupLeaderDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('middlename', instance.middleName);
  return val;
}

_$GroupLeaderDtoImpl _$$GroupLeaderDtoImplFromJson(Map<String, dynamic> json) =>
    _$GroupLeaderDtoImpl(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middlename'] as String?,
    );

Map<String, dynamic> _$$GroupLeaderDtoImplToJson(
        _$GroupLeaderDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middlename': instance.middleName,
    };

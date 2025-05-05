// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_mark_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$StudentMarkDtoToJson(StudentMarkDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('middlename', instance.middleName);
  writeNotNull('exclude', instance.exclude);
  writeNotNull('avg_ball', instance.avgBall);
  return val;
}

_$StudentMarkDtoImpl _$$StudentMarkDtoImplFromJson(Map<String, dynamic> json) =>
    _$StudentMarkDtoImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middlename'] as String?,
      exclude: json['exclude'] as int?,
      avgBall: json['avg_ball'] as int?,
    );

Map<String, dynamic> _$$StudentMarkDtoImplToJson(
        _$StudentMarkDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middlename': instance.middleName,
      'exclude': instance.exclude,
      'avg_ball': instance.avgBall,
    };

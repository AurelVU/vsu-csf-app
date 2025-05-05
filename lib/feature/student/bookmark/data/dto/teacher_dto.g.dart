// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TeacherDtoToJson(TeacherDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('is_selected', instance.isSelected);
  writeNotNull('middlename', instance.middlename);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  return val;
}

_$TeacherDtoImpl _$$TeacherDtoImplFromJson(Map<String, dynamic> json) =>
    _$TeacherDtoImpl(
      id: json['id'] as int?,
      isSelected: json['is_selected'] as bool?,
      middlename: json['middlename'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$$TeacherDtoImplToJson(_$TeacherDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_selected': instance.isSelected,
      'middlename': instance.middlename,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };

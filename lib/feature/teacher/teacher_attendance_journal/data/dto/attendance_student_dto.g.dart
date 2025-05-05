// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_student_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AttendanceStudentDtoToJson(
    AttendanceStudentDto instance) {
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
  return val;
}

_$AttendanceStudentDtoImpl _$$AttendanceStudentDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceStudentDtoImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middlename'] as String?,
    );

Map<String, dynamic> _$$AttendanceStudentDtoImplToJson(
        _$AttendanceStudentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middlename': instance.middleName,
    };

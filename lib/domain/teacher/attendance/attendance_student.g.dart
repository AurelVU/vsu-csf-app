// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceStudentImpl _$$AttendanceStudentImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceStudentImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] as String?,
    );

Map<String, dynamic> _$$AttendanceStudentImplToJson(
    _$AttendanceStudentImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('middle_name', instance.middleName);
  return val;
}

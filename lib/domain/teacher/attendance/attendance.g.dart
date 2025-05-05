// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      studentId: json['student_id'] as String?,
      date: json['date'] as String?,
      lessonNumber: json['lesson_number'] as int?,
      attended: json['attended'] as String?,
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('student_id', instance.studentId);
  writeNotNull('date', instance.date);
  writeNotNull('lesson_number', instance.lessonNumber);
  writeNotNull('attended', instance.attended);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AttendanceDtoToJson(AttendanceDto instance) {
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

_$AttendanceDtoImpl _$$AttendanceDtoImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceDtoImpl(
      studentId: json['student_id'] as String?,
      date: json['date'] as String?,
      lessonNumber: json['lesson_number'] as int?,
      attended: json['attended'] as String?,
    );

Map<String, dynamic> _$$AttendanceDtoImplToJson(_$AttendanceDtoImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'date': instance.date,
      'lesson_number': instance.lessonNumber,
      'attended': instance.attended,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AttendanceDateDtoToJson(AttendanceDateDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  writeNotNull('lesson_number', instance.lessonNumber);
  writeNotNull('lesson_id', instance.lessonId);
  return val;
}

_$AttendanceDateDtoImpl _$$AttendanceDateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDateDtoImpl(
      date: json['date'] as String?,
      lessonNumber: json['lesson_number'] as int?,
      lessonId: json['lesson_id'] as int?,
    );

Map<String, dynamic> _$$AttendanceDateDtoImplToJson(
        _$AttendanceDateDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'lesson_number': instance.lessonNumber,
      'lesson_id': instance.lessonId,
    };

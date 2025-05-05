// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marks_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MarksDtoToJson(MarksDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('teacher', instance.teacher);
  writeNotNull('subject_name', instance.subjectName);
  writeNotNull('mark_type', instance.markType);
  writeNotNull('att1', instance.att1);
  writeNotNull('attendance_percent', instance.attendancePercent);
  writeNotNull('att2', instance.att2);
  writeNotNull('att3', instance.att3);
  writeNotNull('result', instance.result);
  writeNotNull('exam', instance.exam);
  return val;
}

_$MarksDtoImpl _$$MarksDtoImplFromJson(Map<String, dynamic> json) =>
    _$MarksDtoImpl(
      teacher: json['teacher'] as String?,
      subjectName: json['subject_name'] as String?,
      markType: json['mark_type'] as String?,
      att1: json['att1'] as String?,
      attendancePercent: json['attendance_percent'] as String?,
      att2: json['att2'] as String?,
      att3: json['att3'] as String?,
      result: json['result'] as String?,
      exam: json['exam'] as String?,
    );

Map<String, dynamic> _$$MarksDtoImplToJson(_$MarksDtoImpl instance) =>
    <String, dynamic>{
      'teacher': instance.teacher,
      'subject_name': instance.subjectName,
      'mark_type': instance.markType,
      'att1': instance.att1,
      'attendance_percent': instance.attendancePercent,
      'att2': instance.att2,
      'att3': instance.att3,
      'result': instance.result,
      'exam': instance.exam,
    };

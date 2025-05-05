// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ExamDtoToJson(ExamDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('teacher', instance.teacher);
  writeNotNull('subject', instance.subject);
  writeNotNull('classroom', instance.classroom);
  return val;
}

_$ExamDtoImpl _$$ExamDtoImplFromJson(Map<String, dynamic> json) =>
    _$ExamDtoImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      teacher: json['teacher'] as String?,
      subject: json['subject'] as String?,
      classroom: json['classroom'] as String?,
    );

Map<String, dynamic> _$$ExamDtoImplToJson(_$ExamDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'teacher': instance.teacher,
      'subject': instance.subject,
      'classroom': instance.classroom,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('teacher', instance.teacher);
  writeNotNull('classroom', instance.classroom);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('finish_time', instance.finishTime);
  writeNotNull('subject', instance.subject);
  writeNotNull('is_distant', instance.isDistant);
  writeNotNull('id', instance.id);
  return val;
}

_$LessonDtoImpl _$$LessonDtoImplFromJson(Map<String, dynamic> json) =>
    _$LessonDtoImpl(
      teacher: json['teacher'] as String?,
      classroom: json['classroom'] as String?,
      startTime: json['start_time'] as String?,
      finishTime: json['finish_time'] as String?,
      subject: json['subject'] as String?,
      isDistant: json['is_distant'] as bool?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$LessonDtoImplToJson(_$LessonDtoImpl instance) =>
    <String, dynamic>{
      'teacher': instance.teacher,
      'classroom': instance.classroom,
      'start_time': instance.startTime,
      'finish_time': instance.finishTime,
      'subject': instance.subject,
      'is_distant': instance.isDistant,
      'id': instance.id,
    };

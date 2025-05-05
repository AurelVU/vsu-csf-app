// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TeacherLessonDtoToJson(TeacherLessonDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('classroom', instance.classroom);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('finish_time', instance.finishTime);
  writeNotNull('subject', instance.subject);
  writeNotNull('is_distant', instance.isDistant);
  writeNotNull('student_groups', instance.studentGroups);
  writeNotNull('subject_id', instance.subjectId);
  writeNotNull('mark_type', instance.markType);
  return val;
}

_$TeacherLessonDtoImpl _$$TeacherLessonDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherLessonDtoImpl(
      id: json['id'] as int?,
      classroom: json['classroom'] as String?,
      startTime: json['start_time'] as String?,
      finishTime: json['finish_time'] as String?,
      subject: json['subject'] as String?,
      isDistant: json['is_distant'] as bool?,
      studentGroups: (json['student_groups'] as List<dynamic>?)
          ?.map((e) => StudentGroupDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjectId: json['subject_id'] as int?,
      markType: json['mark_type'] as String?,
    );

Map<String, dynamic> _$$TeacherLessonDtoImplToJson(
        _$TeacherLessonDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classroom': instance.classroom,
      'start_time': instance.startTime,
      'finish_time': instance.finishTime,
      'subject': instance.subject,
      'is_distant': instance.isDistant,
      'student_groups': instance.studentGroups,
      'subject_id': instance.subjectId,
      'mark_type': instance.markType,
    };

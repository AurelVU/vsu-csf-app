// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_grades_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SubjectGradesDtoToJson(SubjectGradesDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('marks', instance.marks);
  writeNotNull('students', instance.students);
  writeNotNull('allowed_marks', instance.allowedMarks);
  return val;
}

_$SubjectGradesDtoImpl _$$SubjectGradesDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectGradesDtoImpl(
      marks: (json['marks'] as List<dynamic>?)
          ?.map((e) => MarkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentMarkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedMarks: (json['allowed_marks'] as List<dynamic>?)
          ?.map((e) => AllowedMarkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubjectGradesDtoImplToJson(
        _$SubjectGradesDtoImpl instance) =>
    <String, dynamic>{
      'marks': instance.marks,
      'students': instance.students,
      'allowed_marks': instance.allowedMarks,
    };

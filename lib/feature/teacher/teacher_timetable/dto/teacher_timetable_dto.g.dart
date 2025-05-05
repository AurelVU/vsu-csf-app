// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_timetable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TeacherTimeTableDtoToJson(TeacherTimeTableDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('days', instance.days);
  writeNotNull('numerator', instance.numerator);
  return val;
}

_$TeacherTimeTableDtoImpl _$$TeacherTimeTableDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherTimeTableDtoImpl(
      days: (json['days'] as List<dynamic>?)
          ?.map(
              (e) => TeacherTimetableDayDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      numerator: json['numerator'] as bool?,
    );

Map<String, dynamic> _$$TeacherTimeTableDtoImplToJson(
        _$TeacherTimeTableDtoImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'numerator': instance.numerator,
    };

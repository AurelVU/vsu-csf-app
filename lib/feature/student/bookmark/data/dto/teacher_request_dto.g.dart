// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TeacherRequestDtoToJson(TeacherRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('teacher_id', instance.teacherId);
  return val;
}

_$TeacherRequestDtoImpl _$$TeacherRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherRequestDtoImpl(
      teacherId: json['teacher_id'] as int?,
    );

Map<String, dynamic> _$$TeacherRequestDtoImplToJson(
        _$TeacherRequestDtoImpl instance) =>
    <String, dynamic>{
      'teacher_id': instance.teacherId,
    };

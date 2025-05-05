// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MarkDtoToJson(MarkDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('student_id', instance.studentId);
  writeNotNull('mark_id', instance.markId);
  writeNotNull('value', instance.value);
  writeNotNull('color', instance.color);
  writeNotNull('can_edit', instance.canEdit);
  return val;
}

_$MarkDtoImpl _$$MarkDtoImplFromJson(Map<String, dynamic> json) =>
    _$MarkDtoImpl(
      studentId: json['student_id'] as String?,
      markId: json['mark_id'] as String?,
      value: json['value'] as String?,
      color: json['color'] as String?,
      canEdit: json['can_edit'] as bool?,
    );

Map<String, dynamic> _$$MarkDtoImplToJson(_$MarkDtoImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'mark_id': instance.markId,
      'value': instance.value,
      'color': instance.color,
      'can_edit': instance.canEdit,
    };

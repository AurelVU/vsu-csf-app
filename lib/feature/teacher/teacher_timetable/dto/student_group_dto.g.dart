// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentGroupDtoImpl _$$StudentGroupDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentGroupDtoImpl(
      id: (json['id'] as List<dynamic>?)?.map((e) => e as int).toList(),
      course: json['course'] as int?,
      number: json['number'] as int?,
      subGroupNumber: json['sub_group_number'] as int?,
      curator: json['curator'] == null
          ? null
          : GroupLeaderDto.fromJson(json['curator'] as Map<String, dynamic>),
      groupLeader: json['group_leader'] == null
          ? null
          : GroupLeaderDto.fromJson(
              json['group_leader'] as Map<String, dynamic>),
      groupLeader2: json['group_leader2'] == null
          ? null
          : GroupLeaderDto.fromJson(
              json['group_leader2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentGroupDtoImplToJson(
    _$StudentGroupDtoImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('course', instance.course);
  writeNotNull('number', instance.number);
  writeNotNull('sub_group_number', instance.subGroupNumber);
  writeNotNull('curator', instance.curator);
  writeNotNull('group_leader', instance.groupLeader);
  writeNotNull('group_leader2', instance.groupLeader2);
  return val;
}

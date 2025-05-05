// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TimeTableDtoToJson(TimeTableDto instance) {
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

_$TimeTableDtoImpl _$$TimeTableDtoImplFromJson(Map<String, dynamic> json) =>
    _$TimeTableDtoImpl(
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => DayDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      numerator: json['numerator'] as bool?,
    );

Map<String, dynamic> _$$TimeTableDtoImplToJson(_$TimeTableDtoImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'numerator': instance.numerator,
    };

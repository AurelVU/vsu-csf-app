// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DayDtoToJson(DayDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'date',
      _$JsonConverterToJson<String, DateTime>(
          instance.date, const DatetimeJsonConverter().toJson));
  writeNotNull('lessons', instance.lessons);
  writeNotNull('numerator', instance.numerator);
  return val;
}

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$DayDtoImpl _$$DayDtoImplFromJson(Map<String, dynamic> json) => _$DayDtoImpl(
      date: _$JsonConverterFromJson<String, DateTime>(
          json['date'], const DatetimeJsonConverter().fromJson),
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      numerator: json['numerator'] as bool?,
    );

Map<String, dynamic> _$$DayDtoImplToJson(_$DayDtoImpl instance) =>
    <String, dynamic>{
      'date': _$JsonConverterToJson<String, DateTime>(
          instance.date, const DatetimeJsonConverter().toJson),
      'lessons': instance.lessons,
      'numerator': instance.numerator,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

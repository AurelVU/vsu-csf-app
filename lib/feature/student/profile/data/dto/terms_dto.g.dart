// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TermsDtoToJson(TermsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('numbers', instance.numbers);
  writeNotNull('year', instance.year);
  writeNotNull('marks', instance.marks);
  return val;
}

_$TermsDtoImpl _$$TermsDtoImplFromJson(Map<String, dynamic> json) =>
    _$TermsDtoImpl(
      numbers: json['numbers'] as int?,
      year: json['year'] as String?,
      marks: (json['marks'] as List<dynamic>?)
          ?.map((e) => MarksDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TermsDtoImplToJson(_$TermsDtoImpl instance) =>
    <String, dynamic>{
      'numbers': instance.numbers,
      'year': instance.year,
      'marks': instance.marks,
    };

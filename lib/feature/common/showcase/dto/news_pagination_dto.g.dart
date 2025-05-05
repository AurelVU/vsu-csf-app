// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NewsPaginationDtoToJson(NewsPaginationDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('results', instance.results);
  writeNotNull('description', instance.description);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  return val;
}

_$NewsPaginationDtoImpl _$$NewsPaginationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsPaginationDtoImpl(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => NewsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$$NewsPaginationDtoImplToJson(
        _$NewsPaginationDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
      'description': instance.description,
      'next': instance.next,
      'previous': instance.previous,
    };

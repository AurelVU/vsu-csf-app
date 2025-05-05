// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NewsDtoToJson(NewsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('title', instance.title);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('pictures', instance.pictures);
  writeNotNull('link', instance.link);
  writeNotNull('type', instance.type);
  return val;
}

_$NewsDtoImpl _$$NewsDtoImplFromJson(Map<String, dynamic> json) =>
    _$NewsDtoImpl(
      text: (json['text'] as List<dynamic>?)
          ?.map((e) => TextDetailDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      link: json['link'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$NewsDtoImplToJson(_$NewsDtoImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'pictures': instance.pictures,
      'link': instance.link,
      'type': instance.type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TextDetailDtoToJson(TextDetailDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('link', instance.link);
  writeNotNull('text', instance.text);
  writeNotNull('type', instance.type);
  return val;
}

_$TextDetailDtoImpl _$$TextDetailDtoImplFromJson(Map<String, dynamic> json) =>
    _$TextDetailDtoImpl(
      link: json['link'] as String?,
      text: json['text'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$TextDetailDtoImplToJson(_$TextDetailDtoImpl instance) =>
    <String, dynamic>{
      'link': instance.link,
      'text': instance.text,
      'type': instance.type,
    };

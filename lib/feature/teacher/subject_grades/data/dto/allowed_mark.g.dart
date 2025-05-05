// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allowed_mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AllowedMarkDtoToJson(AllowedMarkDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('subtitle', instance.subtitle);
  writeNotNull('mark_id', instance.markId);
  return val;
}

_$AllowedMarkDtoImpl _$$AllowedMarkDtoImplFromJson(Map<String, dynamic> json) =>
    _$AllowedMarkDtoImpl(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      markId: json['mark_id'] as String?,
    );

Map<String, dynamic> _$$AllowedMarkDtoImplToJson(
        _$AllowedMarkDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'mark_id': instance.markId,
    };

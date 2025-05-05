// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ConsoleParameterToJson(ConsoleParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  writeNotNull('enable', instance.enable);
  writeNotNull('comment', instance.comment);
  return val;
}

_$ConsoleParameterImpl _$$ConsoleParameterImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsoleParameterImpl(
      name: json['name'] as String?,
      value: json['value'] as String?,
      enable: json['enable'] as bool?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$ConsoleParameterImplToJson(
        _$ConsoleParameterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'enable': instance.enable,
      'comment': instance.comment,
    };

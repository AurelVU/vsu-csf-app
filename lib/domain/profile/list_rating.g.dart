// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ListRatingToJson(ListRating instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('ratings', instance.ratings);
  return val;
}

_$ListRatingImpl _$$ListRatingImplFromJson(Map<String, dynamic> json) =>
    _$ListRatingImpl(
      name: json['name'] as String?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => AnonymousRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListRatingImplToJson(_$ListRatingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ratings': instance.ratings,
    };

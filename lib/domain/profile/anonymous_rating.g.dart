// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anonymous_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AnonymousRatingToJson(AnonymousRating instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('place', instance.place);
  writeNotNull('rating', instance.rating);
  writeNotNull('is_current_user', instance.isCurrentUser);
  return val;
}

_$AnonymousRatingImpl _$$AnonymousRatingImplFromJson(
        Map<String, dynamic> json) =>
    _$AnonymousRatingImpl(
      name: json['name'] as String?,
      place: json['place'] as int?,
      rating: json['rating'] as String?,
      isCurrentUser: json['is_current_user'] as bool?,
    );

Map<String, dynamic> _$$AnonymousRatingImplToJson(
        _$AnonymousRatingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'place': instance.place,
      'rating': instance.rating,
      'is_current_user': instance.isCurrentUser,
    };

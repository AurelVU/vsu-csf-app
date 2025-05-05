// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$StudentRatingToJson(StudentRating instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('course', instance.course);
  writeNotNull('specialty', instance.specialty);
  writeNotNull('group', instance.group);
  writeNotNull('list_ratings', instance.listRatings);
  return val;
}

_$StudentRatingImpl _$$StudentRatingImplFromJson(Map<String, dynamic> json) =>
    _$StudentRatingImpl(
      course: json['course'] as int?,
      specialty: json['specialty'] as int?,
      group: json['group'] as int?,
      listRatings: (json['list_ratings'] as List<dynamic>?)
          ?.map((e) => ListRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentRatingImplToJson(_$StudentRatingImpl instance) =>
    <String, dynamic>{
      'course': instance.course,
      'specialty': instance.specialty,
      'group': instance.group,
      'list_ratings': instance.listRatings,
    };

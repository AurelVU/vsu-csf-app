import 'package:freezed_annotation/freezed_annotation.dart';

part 'anonymous_rating.freezed.dart';

part 'anonymous_rating.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class AnonymousRating with _$AnonymousRating {
  factory AnonymousRating({
    String? name,
    int? place,
    String? rating,
    @JsonKey(name: 'is_current_user') bool? isCurrentUser,
  }) = _AnonymousRating;

  factory AnonymousRating.fromJson(Map<String, dynamic> json) =>
      _$AnonymousRatingFromJson(json);
}

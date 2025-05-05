import 'package:fkn/domain/profile/anonymous_rating.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'list_rating.g.dart';
part 'list_rating.freezed.dart';


@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class ListRating with _$ListRating {

  factory ListRating({
    String? name,
    List<AnonymousRating>? ratings,
  }) = _ListRating;

  factory ListRating.fromJson(Map<String, dynamic> json) => _$ListRatingFromJson(json);
}

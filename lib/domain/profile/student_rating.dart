import 'package:fkn/domain/profile/list_rating.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'student_rating.g.dart';
part 'student_rating.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class StudentRating with _$StudentRating {


  factory StudentRating({
    int? course,
    int? specialty,
    int? group,
    @JsonKey(name: 'list_ratings') List<ListRating>? listRatings,
  }) = _StudentRating;

  factory StudentRating.fromJson(Map<String, dynamic> json) =>
      _$StudentRatingFromJson(json);
}

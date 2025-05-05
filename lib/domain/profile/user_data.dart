import 'package:fkn/domain/profile/result/semester_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

abstract class IUserData {
  IUserData({
    this.userId,
  });

  final String? userId;
}

@freezed
class UserData extends IUserData with _$UserData {
  factory UserData({
    String? userId,
    String? studentCard,
    String? name,
    int? group,
    int? subGroup,
    int? course,
    List<SemesterResult>? results,
    bool? acceptPolitics,
  }) = _UserData;
}

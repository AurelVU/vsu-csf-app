import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_mark.freezed.dart';

@freezed
class StudentMark with _$StudentMark {
  factory StudentMark({
    String? id,
    String? firstName,
    String? lastName,
    String? middleName,
    int? exclude,
    int? avgBall,
  }) = _StudentMark;
}

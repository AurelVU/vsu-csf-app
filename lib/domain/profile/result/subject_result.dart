import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_result.freezed.dart';


// результаты за аттестацию
@freezed
class SubjectResult  with _$SubjectResult {
  factory SubjectResult({
    String? teacher,
    String? subjectName,
    String? att1,
    String? att2,
    String? att3,
    String? attendancePercent,
    String? result,
    String? exam,
    String? markType,

  }) = _SubjectResult;
}

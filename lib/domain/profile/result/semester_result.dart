import 'package:fkn/domain/profile/result/subject_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'semester_result.freezed.dart';


@freezed
class SemesterResult  with _$SemesterResult {
  factory SemesterResult({
    List<SubjectResult>? results,
    int? number,
    String? year,

  }) = _SemesterResult;
}

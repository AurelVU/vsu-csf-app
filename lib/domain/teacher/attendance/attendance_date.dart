import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_date.freezed.dart';

@freezed
class AttendanceDate with _$AttendanceDate {
  factory AttendanceDate({
    String? date,
    int? lessonNumber,
    int? lessonId,
  }) = _AttendanceDate;
}

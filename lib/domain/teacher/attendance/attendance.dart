import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  @JsonSerializable(
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  factory Attendance({
    String? studentId,
    String? date,
    int? lessonNumber,
    String? attended,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}

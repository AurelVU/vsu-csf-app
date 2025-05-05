import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_student.freezed.dart';
part 'attendance_student.g.dart';


@Freezed(fromJson: true, toJson: true)
class AttendanceStudent with _$AttendanceStudent {
  @JsonSerializable(
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  factory  AttendanceStudent({
    String? id,
    String? firstName,
    String? lastName,
    String? middleName,
  }) = _AttendanceStudent;

  factory AttendanceStudent.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStudentFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_info.freezed.dart';

@freezed
class TeacherInfo with _$TeacherInfo {
  factory TeacherInfo({
    String? firstName,
    String? lastName,
    String? middlename,
    String? rank,
    String? departmentName,
    String? faculty,
    bool? acceptPolitic,
  }) = _TeacherInfo;
}

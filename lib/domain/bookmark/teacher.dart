import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';

@freezed
class Teacher with _$Teacher {
  factory Teacher({
    int? id,
    @Freezed(equal: false) bool? isSelected,
    String? middlename,
    String? firstName,
    String? lastName,
  }) = _Teacher;
}

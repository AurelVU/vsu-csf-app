import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark.freezed.dart';

@freezed
class Mark with _$Mark {
  factory Mark({
    String? studentId,
    String? markId,
    String? value,
    String? color,
    bool? canEdit,
  }) = _Mark;
}

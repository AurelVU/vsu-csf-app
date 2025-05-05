import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';



@freezed
class Subject  with _$Subject {
  factory Subject({
    String? startTime,
    String? finishTime,
    String? name,
    String? classroom,
    String? teacher,
    bool? isDistant,
    int? id,
  }) = _Subject;
}

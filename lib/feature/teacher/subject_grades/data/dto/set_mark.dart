import 'dart:async';

import 'package:fkn/utils/regexes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_mark.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
class SetMark {
  SetMark({
    required this.studentId,
    required this.markId,
    required this.value,
  });

  final String studentId;
  final String markId;
  final String value;

  Json toJson() => _$SetMarkToJson(this);
}

FutureOr<Json> serializeSetMark(SetMark object) =>
    object.toJson();

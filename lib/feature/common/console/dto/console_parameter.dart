import 'package:freezed_annotation/freezed_annotation.dart';

part 'console_parameter.freezed.dart';

part 'console_parameter.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class ConsoleParameter with _$ConsoleParameter {
  factory ConsoleParameter({
    String? name,
    String? value,
    bool? enable,
    String? comment,
  }) = _ConsoleParameter;

  factory ConsoleParameter.fromJson(Map<String, dynamic> json) => _$ConsoleParameterFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_leader_dto.g.dart';
part 'group_leader_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class GroupLeaderDto with _$GroupLeaderDto {
  const factory GroupLeaderDto({
    String? email,
    String? phone,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middlename') String? middleName,
  }) = _GroupLeaderDto;

  factory GroupLeaderDto.fromJson(Map<String, dynamic> json) => _$GroupLeaderDtoFromJson(json);
}

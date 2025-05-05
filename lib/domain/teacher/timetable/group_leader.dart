
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_leader.freezed.dart';


/// это модель не связана с дтошкой, потому что используется там, где бека нет
@freezed
class GroupLeader  with _$GroupLeader {
  factory  GroupLeader({
      String? email,
      String? phone,
      String? firstName,
      String? lastName,
      String? middleName,
  }) = _GroupLeader;
}

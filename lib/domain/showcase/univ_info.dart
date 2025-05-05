
import 'package:freezed_annotation/freezed_annotation.dart';

part 'univ_info.freezed.dart';


@freezed
class UnivInfo with _$UnivInfo {
  const factory UnivInfo({
    String? name,

  }) = _UnivInfo;

}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_info.freezed.dart';



@freezed
class PartnerInfo  with _$PartnerInfo {
  factory PartnerInfo({
    String? picture,
    String? description,



  }) = _PartnerInfo;
}

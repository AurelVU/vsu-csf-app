import 'package:freezed_annotation/freezed_annotation.dart';

part 'allowed_mark.freezed.dart';

@freezed
class AllowedMark with _$AllowedMark {
  factory AllowedMark({
    String? title,
    String? subtitle,
    String? markId,
  }) = _AllowedMark;
}
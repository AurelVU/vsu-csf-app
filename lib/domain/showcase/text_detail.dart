
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_detail.freezed.dart';


@freezed
class TextDetail with _$TextDetail {
  const factory TextDetail({
    String? link,
    String? text,
    String? type,

  }) = _TextDetail;

}

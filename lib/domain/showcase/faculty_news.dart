import 'package:fkn/domain/showcase/text_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_news.freezed.dart';




@freezed
class FacultyNews  with _$FacultyNews {
  factory FacultyNews({
    List<String?>? picture,
    List<TextDetail>? text,
    String? title,
    String? date,
    String? index,
    String? link,
    String? type,

  }) = _FacultyNews;
}

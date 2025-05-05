import 'package:fkn/domain/timetable/subject.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_subject.freezed.dart';




@freezed
class NextSubject  with _$NextSubject {
  factory NextSubject({
    Subject? subject,
    String? status,

  }) = _NextSubject;
}

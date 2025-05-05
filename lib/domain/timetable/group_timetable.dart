import 'package:fkn/domain/timetable/subject.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_timetable.freezed.dart';



@freezed
class DayTimetable  with _$DayTimetable {
  factory  DayTimetable({
    DateTime? dateTimetable,
    List<Subject>? subjects,
    bool? numerator,
  }) = _DayTimetable;
}

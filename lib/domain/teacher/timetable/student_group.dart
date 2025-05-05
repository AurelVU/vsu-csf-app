import 'package:fkn/domain/teacher/timetable/group_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_group.freezed.dart';



@freezed
class StudentGroup  with _$StudentGroup {
  factory  StudentGroup({
    List<int>? id,
    int? course,
    int? number,
    int? subGroupNumber,
    GroupLeader? curator,
    GroupLeader? groupLeader,
    GroupLeader? secondGroupLeader,
  }) = _StudentGroup;
}

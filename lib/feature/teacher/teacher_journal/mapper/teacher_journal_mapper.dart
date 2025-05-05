import 'package:fkn/domain/teacher/timetable/group_leader.dart';
import 'package:fkn/domain/teacher/timetable/student_group.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/group_leader_dto.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/student_group_dto.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/teacher_lesson_dto.dart';

TeacherLesson getTeacherLessonFromDto(TeacherLessonDto dto) {
  return TeacherLesson(
    id: dto.id,
    classroom: dto.classroom,
    startTime: dto.startTime,
    finishTime: dto.finishTime,
    subject: dto.subject,
    subjectId: dto.subjectId,
    markType: dto.markType,
    isDistant: dto.isDistant,
    studentGroups: dto.studentGroups?.map(getStudentGroupFromDto).toList(),
  );
}

StudentGroup getStudentGroupFromDto(StudentGroupDto dto) {
  return StudentGroup(
    id: dto.id,
    course: dto.course,
    number: dto.number,
    subGroupNumber: dto.subGroupNumber,
    curator: getGroupLeaderFromDto(dto.curator),
    groupLeader: getGroupLeaderFromDto(dto.groupLeader),
    secondGroupLeader: getGroupLeaderFromDto(dto.groupLeader2),
  );
}

GroupLeader? getGroupLeaderFromDto(GroupLeaderDto? dto) {
  if (dto == null) {
    return null;
  }
  return GroupLeader(
    email: dto.email,
    phone: dto.phone,
    firstName: dto.firstName,
    middleName: dto.middleName,
    lastName: dto.lastName,
  );
}

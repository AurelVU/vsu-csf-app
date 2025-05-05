import 'package:fkn/domain/teacher/subject_marks/subject_grades.dart';
import 'package:fkn/feature/teacher/subject_grades/data/subject_grades_service.dart';

import 'dto/set_grades_requests.dart';
import 'dto/subject_grades_request_dto.dart';
import 'mapper/subject_grades_mapper.dart';

class SubjectGradesRepository {
  SubjectGradesRepository(this._service);

  final SubjectGradesService _service;

  Future<SubjectGrades> getSubjectGrades({
    required List<int> groupIds,
    required int subjectId,
  }) async {
    try {
      final request = SubjectGradesRequestDto(
        groupIds: groupIds,
        subjectId: subjectId,
      );
      final attendance = await _service.getSubjectGrades(request: request);
      return getSubjectGradesFromDto(attendance);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setStudentGrades(SetGradesRequest request) async {
    try {
      await _service.setStudentGrades(request: request);
    } catch (e) {
      rethrow;
    }
  }
}

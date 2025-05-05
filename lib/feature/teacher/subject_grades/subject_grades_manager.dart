import 'package:fkn/domain/teacher/subject_marks/subject_grades.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:rxdart/rxdart.dart';

import 'data/dto/set_grades_requests.dart';
import 'data/subject_grades_repository.dart';

class SubjectGradesManager extends LifecycleModule {
  SubjectGradesManager(this._subjectGradesRepository);

  BehaviorSubject<SubjectGrades> subjectGrades = BehaviorSubject();

  final SubjectGradesRepository _subjectGradesRepository;


  @override
  void dispose() {
    subjectGrades.close();
  }

  Future<void> getSubjectGrades({
    required List<int> groupIds,
    required int subjectId,
  }) async {
    try {
      subjectGrades.value = await _subjectGradesRepository.getSubjectGrades(
          groupIds: groupIds, subjectId: subjectId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setStudentGrades(SetGradesRequest request) async {
    try {
      await _subjectGradesRepository.setStudentGrades(request);
    } catch (e) {
      rethrow;
    }
  }
}

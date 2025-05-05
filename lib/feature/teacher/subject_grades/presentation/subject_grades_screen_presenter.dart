import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/teacher/subject_marks/allowed_mark.dart';
import 'package:fkn/domain/teacher/subject_marks/mark.dart';
import 'package:fkn/domain/teacher/subject_marks/student_mark.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/set_grades_requests.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/set_mark.dart';
import 'package:fkn/feature/teacher/subject_grades/subject_grades_manager.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:rxdart/rxdart.dart';

import 'components/student_grades.dart';

class SubjectGradesScreenPresenter extends LifecycleModule {
  SubjectGradesScreenPresenter({
    required this.subjectGradesManager,
    required this.router,
    required this.lessonId,
    required this.subjectId,
    required this.groupIds,
  });

  final StackRouter router;
  final SubjectGradesManager subjectGradesManager;
  final List<int> groupIds;
  final int lessonId;
  final int subjectId;

  final LinkedScrollControllerGroup groupController =
      LinkedScrollControllerGroup();

  final BehaviorSubject<AllowedMark?> selectedGradeStream =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<List<SetMark>?> assignedGradesStream =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<bool> horizontalScrollStream =
      BehaviorSubject.seeded(true);

  final BehaviorSubject<List<StudentGrades>?> studentGradesStream =
      BehaviorSubject();

  @override
  void init() {
    _getSubjectGrades();
    super.init();
  }

  @override
  void dispose() {
    selectedGradeStream.close();
    assignedGradesStream.close();
    studentGradesStream.close();
    horizontalScrollStream.close();
    super.dispose();
  }

  void goToBack() {
    router.pop();
  }

  Future<void> _getSubjectGrades() async {
    try {
      await subjectGradesManager.getSubjectGrades(
        groupIds: groupIds,
        subjectId: subjectId,
      );
      _getStudentGrades();
    } catch (e) {
      rethrow;
    }
  }

  bool isSelectedAllowedMark(AllowedMark mark) {
    final selectedMark = selectedGradeStream.value;
    if (selectedMark == null || mark.markId == null) {
      return false;
    }
    return selectedMark.markId == mark.markId;
  }

  bool isSelectedMark(ModifiableMark mark) {
    final selectedMark = selectedGradeStream.value;
    if (selectedMark == null) {
      return false;
    }
    return selectedMark.markId == mark.markId;
  }

  void setSelectedGrade(AllowedMark mark) {
    if (mark.markId == null) {
      return;
    }
    if (mark == selectedGradeStream.value) {
      selectedGradeStream.value = null;
      return;
    }
    selectedGradeStream.value = mark;
  }

  void _getStudentGrades() {
    final subjectGrades = subjectGradesManager.subjectGrades.value;
    final students = subjectGrades.students ?? [];
    final allowedMarks = subjectGrades.allowedMarks ?? [];
    if (students.isEmpty || allowedMarks.isEmpty) {
      return;
    }
    final marks = subjectGrades.marks ?? [];
    final studentGrades = <StudentGrades>[];
    for (StudentMark student in students) {
      final modifiableMarks = <ModifiableMark>[];
      for (AllowedMark allowedMark in allowedMarks) {
        final mark = marks
            .where((m) =>
                m.studentId == student.id && m.markId == allowedMark.markId)
            .firstOrNull;
        final studentMark =
            _createStudentMark(mark, student.id, allowedMark.markId);
        modifiableMarks.add(studentMark);
      }
      final studentGrade = StudentGrades(
        studentId: student.id ?? '',
        fullName: createFullName(student.firstName, '', student.lastName),
        grades: modifiableMarks,
      );
      studentGrades.add(studentGrade);
    }
    studentGradesStream.add(studentGrades);
  }

  Future<void> saveStudentGrades() async {
    final marks = assignedGradesStream.valueOrNull ?? [];
    if (marks.isEmpty) {
      return;
    }
    try {
      assignedGradesStream.value = [];
      final request = SetGradesRequest(
        groupIds: groupIds,
        lessonId: lessonId,
        marks: marks.toSet().toList(),
      );
      await subjectGradesManager.setStudentGrades(request);
    } catch (e) {
      rethrow;
    }
  }

  void changeStudentGrade(ModifiableMark mark, String newValue) {
    openHorizontalScroll();
    final assignedGrades = assignedGradesStream.value ?? [];
    final changes = assignedGrades
        .any((g) => g.studentId == mark.studentId && g.markId == mark.markId);

    /// Если такое значение уже есть
    if (changes) {
      final currentGrade = assignedGrades.firstWhere(
          (g) => g.studentId == mark.studentId && g.markId == mark.markId);

      /// Если значение не поменялось
      if (currentGrade.value == newValue) {
        return;
      }
      assignedGrades.remove(currentGrade);

      /// Если значение вернулось в начальное
      if (mark.initialMark == newValue) {
        assignedGradesStream.value = assignedGrades;
        return;
      }
      final newGrade = SetMark(
        studentId: mark.studentId,
        markId: mark.markId,
        value: newValue,
      );
      assignedGrades.add(newGrade);
      assignedGradesStream.value = assignedGrades;
    } else {
      if (mark.initialMark == newValue) {
        return;
      }

      final newGrade = SetMark(
        studentId: mark.studentId,
        markId: mark.markId,
        value: newValue,
      );
      assignedGrades.add(newGrade);
      assignedGradesStream.value = assignedGrades;
    }
  }

  ModifiableMark _createStudentMark(
      Mark? mark, String? studentId, String? markId) {
    if (mark == null) {
      return ModifiableMark(
        studentId: studentId ?? '',
        markId: markId ?? '',
        value: '',
        canEdit: true,
        initialMark: '',
      );
    }
    return ModifiableMark(
      studentId: mark.studentId ?? studentId ?? '',
      markId: mark.markId ?? markId ?? '',
      value: mark.value ?? '',
      canEdit: mark.canEdit ?? true,
      initialMark: mark.value ?? '',
      color: mark.color,
    );
  }

  void hideHorizontalScroll() {
    horizontalScrollStream.add(false);
  }

  void openHorizontalScroll() {
    horizontalScrollStream.add(true);
  }
}

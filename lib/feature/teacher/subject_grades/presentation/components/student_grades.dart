class StudentGrades {
  final String studentId;
  final String fullName;
  final int? exclude;
  final int? avgBall;
  final List<ModifiableMark> grades;

  StudentGrades({
    required this.studentId,
    required this.fullName,
    required this.grades,
    this.exclude,
    this.avgBall,
  });

  StudentGrades copyWith({required List<ModifiableMark> newGrades}) {
    return StudentGrades(
      studentId: studentId,
      fullName: fullName,
      exclude: exclude,
      avgBall: avgBall,
      grades: newGrades,
    );
  }
}

class ModifiableMark {
  final String studentId;
  final String markId;
  final String value;
  final String? color;
  final bool canEdit;
  final String initialMark;

  ModifiableMark({
    required this.studentId,
    required this.markId,
    required this.value,
    required this.canEdit,
    required this.initialMark,
    this.color,
  });

  ModifiableMark copyWith({required String newValue}) {
    return ModifiableMark(
      studentId: studentId,
      markId: markId,
      value: newValue,
      color: color,
      canEdit: canEdit,
      initialMark: initialMark,
    );
  }
}

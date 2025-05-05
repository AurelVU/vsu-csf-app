import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_showcase/data/teacher_showcase_repository.dart';


class TeacherShowcaseManager extends LifecycleModule {
  TeacherShowcaseManager(
    this._teacherShowcaseRepository,
  );


  final TeacherShowcaseRepository _teacherShowcaseRepository;


}


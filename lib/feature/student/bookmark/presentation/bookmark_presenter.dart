import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/bookmark/bookmark_manager.dart';
import 'package:fkn/router/router.dart';

class BookmarkScreenPresenter extends LifecycleModule {
  BookmarkScreenPresenter({
    required this.bookmarkManager,
    required this.router,
  });

  @override
  void init() {
    super.init();
    bookmarkManager.updateTeacherList();
  }

  final BookmarkManager bookmarkManager;
  final StackRouter router;

  Future<void> bookmarkTeacher({required int teacherId}) async {
    bookmarkManager.bookmarkTeacher(teacherId: teacherId);
  }

  Future<void> unbookmarkTeacher({required int teacherId}) async {
    bookmarkManager.unbookmarkTeacher(teacherId: teacherId);
  }

  Future<void> openTeacherTimetable({required int teacherId, required String title}) async {
    router.navigate(TeacherTimetableBookmarkRoute(teacherId: teacherId, title: title));
  }

  void search(String text) {
    bookmarkManager.changeAccordingSearch(text);
  }
}

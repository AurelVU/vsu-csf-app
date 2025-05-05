import 'package:fkn/domain/bookmark/teacher.dart';
import 'package:fkn/feature/student/bookmark/data/bookmark_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../../../environment/lifecycle_module.dart';

class BookmarkManager extends LifecycleModule {
  BookmarkManager(
    this._bookmarkRepository,
  );

  final BookmarkRepository _bookmarkRepository;

  /// стрим для представления
  BehaviorSubject<List<Teacher>?> teacherListStream = BehaviorSubject();

  /// стрим для избранных
  BehaviorSubject<Set<Teacher>?> bookmarkedSetStream = BehaviorSubject();

  /// семантически неизменяемый список, используется для поиска
  List<Teacher> constTeacherList = [];

  Future<void> updateTeacherList() async {
    teacherListStream.value = null;
    final teacherList = await _bookmarkRepository.getTeacherList();

    sortList(teacherList);
    constTeacherList = teacherList;
    teacherListStream.value = teacherList;
    /// МЫ ЦЕЛИКОМ И ПОЛНОСТЬЮ ВЕРИМ НАШЕМУ БЕКУ, ЧТО ОН СНАЧАЛА ВЕРНЕТ ОТМЕЧЕННЫХ
    final Set<Teacher> bookmarkedSet = {};
    for (var element in teacherList) {
      if (element.isSelected == true) {
        bookmarkedSet.add(element);
      }
    }
    bookmarkedSetStream.value = bookmarkedSet;

  }

  Future<void> bookmarkTeacher({required int teacherId}) async {
    _bookmarkRepository.bookmarkTeacher(teacherId: teacherId);
    final list = teacherListStream.value ?? <Teacher>[];

    final indexOfTeacher = list.indexWhere((element) => element.id == teacherId);
    final bookmarkedTeacher = list[indexOfTeacher];
    list[indexOfTeacher] = bookmarkedTeacher.copyWith(isSelected: true);

    final indexOfTeacherConst = constTeacherList.indexWhere((element) => element.id == teacherId);
    final bookmarkedTeacherConst = constTeacherList[indexOfTeacherConst];
    constTeacherList[indexOfTeacherConst] = bookmarkedTeacherConst.copyWith(isSelected: true);

    sortList(list);
    teacherListStream.value = list;
    final set = bookmarkedSetStream.value;
    set?.add(bookmarkedTeacher.copyWith(isSelected: true));
    bookmarkedSetStream.value = set;

  }

  Future<void> unbookmarkTeacher({required int teacherId}) async {
    _bookmarkRepository.unbookmarkTeacher(teacherId: teacherId);
    final list = teacherListStream.value ?? <Teacher>[];
    final indexOfTeacher = list.indexWhere((element) => element.id == teacherId);
    final bookmarkedTeacher = list[indexOfTeacher];
    list[indexOfTeacher] = bookmarkedTeacher.copyWith(isSelected: false);

    final indexOfTeacherConst = constTeacherList.indexWhere((element) => element.id == teacherId);
    final bookmarkedTeacherConst = constTeacherList[indexOfTeacherConst];
    constTeacherList[indexOfTeacherConst] = bookmarkedTeacherConst.copyWith(isSelected: false);


    sortList(list);
    teacherListStream.value = list;
    final set = bookmarkedSetStream.value;
    set?.remove(bookmarkedTeacher.copyWith(isSelected: true));
    bookmarkedSetStream.value = set;


  }

  void changeAccordingSearch(String text) {
    final result = constTeacherList.where((element) {
      final fullName = '${element.lastName} ${element.firstName} ${element.middlename}'.toLowerCase();
      return fullName.contains(text.toLowerCase());
    }).toList();
    sortList(result);
    teacherListStream.value = result;
  }

  /// сначала показываются выбранные преподаватели
  /// потом сортировка по фамилии, имени, отчеству
  void sortList(List<Teacher> list) {
    list.sort(
      (a, b) {
        if (a.isSelected != b.isSelected) {
          if (a.isSelected == true) {
            return -1;
          } else {
            return 1;
          }
        }
        final compareLastName = a.lastName?.compareTo(b.lastName ?? '') ?? 0;
        if (compareLastName == 0) {
          final compareFirstName = a.firstName?.compareTo(b.firstName ?? '') ?? 0;
          if (compareFirstName == 0) {
            final compareMiddlename = a.middlename?.compareTo(b.middlename ?? '') ?? 0;
            return compareMiddlename;
          } else {
            return compareFirstName;
          }
        }
        return compareLastName;
      },
    );
  }
}

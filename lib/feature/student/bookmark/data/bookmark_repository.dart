import 'package:fkn/domain/bookmark/teacher.dart';
import 'package:fkn/feature/student/bookmark/data/bookmark_service.dart';
import 'package:fkn/feature/student/bookmark/data/dto/teacher_request_dto.dart';

class BookmarkRepository {
  BookmarkRepository(this._service);

  final BookmarkService _service;

  Future<List<Teacher>> getTeacherList() async {
    final response = await _service.getTeacherList();
    final result = response.map((e) {
      return Teacher(
        id: e.id,
        firstName: e.firstName,
        isSelected: e.isSelected,
        lastName: e.lastName,
        middlename: e.middlename,
      );
    }).toList();
    return result;
  }

  Future<void> bookmarkTeacher({required int teacherId}) async{
    _service.addTeacherBookmark(requestDto: TeacherRequestDto(teacherId: teacherId));
  }


  Future<void> unbookmarkTeacher({required int teacherId}) async{
    _service.deleteTeacherBookmark(requestDto: TeacherRequestDto(teacherId: teacherId));
  }


}

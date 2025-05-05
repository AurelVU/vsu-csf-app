import 'package:dio/dio.dart';
import 'package:fkn/feature/student/teacher_timetable/data/teacher_timetable_url.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/teacher_timetable_dto.dart';

import 'package:retrofit/retrofit.dart';


part 'teacher_timetable_bookmark_service.g.dart';

@RestApi()
abstract class TeacherTimetableBookmarkService {
  factory TeacherTimetableBookmarkService(Dio dio, {String baseUrl}) = _TeacherTimetableBookmarkService;

  @GET(TeacherTimetableUrl.timetableForStudent)
  Future<TeacherTimeTableDto> getTeacherTimetable({
    @Query('date') required String date,
    @Query('teacher_id') required int teacherId,
  });



}


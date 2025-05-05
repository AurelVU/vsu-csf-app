import 'package:dio/dio.dart';
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_url.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/teacher_timetable_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'teacher_timetable_service.g.dart';

@RestApi()
abstract class TeacherTimetableService {
  factory TeacherTimetableService(Dio dio, {String baseUrl}) = _TeacherTimetableService;

  @GET(TeacherTimetableUrl.timetable)
  Future<TeacherTimeTableDto> getTeacherTimetable({
    @Query('date') required String date,
  });
}

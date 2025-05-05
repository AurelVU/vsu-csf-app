import 'package:dio/dio.dart';
import 'package:fkn/feature/student/timetable/data/timetable_url.dart';
import 'package:fkn/feature/student/timetable/dto/exam_dto.dart';
import 'package:fkn/feature/student/timetable/dto/timetable_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'timetable_service.g.dart';

@RestApi()
abstract class TimeTableService {
  factory TimeTableService(Dio dio, {String baseUrl}) = _TimeTableService;

  @GET(TimeTableUrl.timetable)
  Future<TimeTableDto> getTimetableTimetable({
    @Query('date') required String date,
  });

  @GET(TimeTableUrl.exams)
  Future<List<ExamDto>> getExamTimeTable();



}

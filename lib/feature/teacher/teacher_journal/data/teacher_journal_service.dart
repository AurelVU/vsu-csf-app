import 'package:dio/dio.dart';
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_url.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/teacher_lesson_dto.dart';

import 'package:retrofit/retrofit.dart';


part 'teacher_journal_service.g.dart';

@RestApi()
abstract class TeacherJournalService {
  factory TeacherJournalService(Dio dio, {String baseUrl}) = _TeacherJournalService;

  @GET(TeacherJournalUrl.teacherJournal)
  Future<List<TeacherLessonDto>> getTeacherJournal();



}


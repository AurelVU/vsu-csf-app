import 'package:dio/dio.dart';
import 'package:fkn/feature/teacher/subject_grades/data/subject_marks_url.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/set_grades_requests.dart';
import 'dto/subject_grades_dto.dart';
import 'dto/subject_grades_request_dto.dart';

part 'subject_grades_service.g.dart';

@RestApi()
abstract class SubjectGradesService {
  factory SubjectGradesService(Dio dio, {String baseUrl}) =
  _SubjectGradesService;

  @POST(SubjectGradesUrl.subjectGrades)
  Future<SubjectGradesDto> getSubjectGrades({
    @Body() required SubjectGradesRequestDto request,
  });

  @POST(SubjectGradesUrl.setGrades)
  Future<void> setStudentGrades({
    @Body() required SetGradesRequest request,
  });
}

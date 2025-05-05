import 'package:dio/dio.dart';
import 'package:fkn/feature/teacher/teacher_showcase/data/teacher_showcase_url.dart';

import 'package:retrofit/retrofit.dart';

part 'teacher_showcase_service.g.dart';

@RestApi()
abstract class TeacherShowcaseService {
  factory TeacherShowcaseService(Dio dio, {String baseUrl}) = _TeacherShowcaseService;

  @GET(TeacherShowcaseUrl.example)
  Future<void> getExample();
}

import 'package:dio/dio.dart';
import 'package:fkn/domain/profile/student_rating.dart';
import 'package:fkn/feature/student/rating/data/career_url.dart';

import 'package:retrofit/retrofit.dart';


part 'career_service.g.dart';

@RestApi()
abstract class CareerService {
  factory CareerService(Dio dio, {String baseUrl}) = _CareerService;


  @GET(CareerUrl.studentRating)
  Future<StudentRating> getStudentRating({
    @Query('semester') int? semester,
    @Query('year') String? year,
  });
}

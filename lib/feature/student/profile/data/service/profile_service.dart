import 'package:dio/dio.dart';
import 'package:fkn/domain/profile/student_rating.dart';
import 'package:fkn/feature/student/profile/data/dto/student_profile_dto.dart';
import 'package:fkn/feature/student/profile/data/model/auth_request.dart';
import 'package:fkn/feature/student/profile/data/model/auth_response.dart';
import 'package:fkn/feature/student/profile/data/profile_url.dart';
import 'package:fkn/feature/teacher/teacher_profile/data/dto/free_token_dto.dart';
import 'package:fkn/feature/teacher/teacher_profile/data/dto/token_free_request_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST(ProfileUrl.passwordLogin)
  Future<AuthResponse> postAuthPasswordLogin({
    @Body() required AuthRequest request,
  });

  @DELETE(ProfileUrl.user)
  Future<StudentProfileDto> deleteStudentProfile();

  @GET(ProfileUrl.studentProfile)
  Future<StudentProfileDto> getStudentProfile();

  @GET(ProfileUrl.studentRating)
  Future<StudentRating> getStudentRating({
    @Query('semester') int? semester,
    @Query('year') String? year,
  });

  @POST(ProfileUrl.freeToken)
  Future<FreeTokenDto> postTokenFree({
    @Body() required TokenFreeRequestDto request,
  });
}

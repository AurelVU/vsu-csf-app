import 'package:dio/dio.dart';
import 'package:fkn/feature/student/bookmark/data/bookmark_url.dart';
import 'package:fkn/feature/student/bookmark/data/dto/teacher_dto.dart';
import 'package:fkn/feature/student/bookmark/data/dto/teacher_request_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'bookmark_service.g.dart';

@RestApi()
abstract class BookmarkService {
  factory BookmarkService(Dio dio, {String baseUrl}) = _BookmarkService;


  @GET(BookmarkUrl.teacherList)
  Future<List<TeacherDto>> getTeacherList();

  @POST(BookmarkUrl.teacherList)
  Future<void> addTeacherBookmark({
    @Body() required TeacherRequestDto requestDto,
});

  @DELETE(BookmarkUrl.teacherList)
  Future<void> deleteTeacherBookmark({
    @Body() required TeacherRequestDto requestDto,
  });

}

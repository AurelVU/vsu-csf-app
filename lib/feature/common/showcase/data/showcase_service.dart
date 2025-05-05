import 'package:dio/dio.dart';
import 'package:fkn/feature/common/showcase/data/showcase_url.dart';
import 'package:fkn/feature/common/showcase/dto/news_pagination_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'showcase_service.g.dart';

@RestApi()
abstract class ShowcaseService {
  factory ShowcaseService(Dio dio, {String baseUrl}) = _ShowcaseService;



  /// cs_csu - факультета
  /// admin_panel - карьера
  /// vsumain - универ
  ///
  @GET(ShowcaseUrl.newsByGroup)
  Future<NewsPaginationDto> getNewsByGroup({
    @Query('page_size') int? pageSize,
    @Query('page') int? page,
    @Query('group') required String group,
  });



}

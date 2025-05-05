import 'package:dio/dio.dart';
import 'package:fkn/feature/common/politic/data/politic_url.dart';

import 'package:retrofit/retrofit.dart';

part 'politic_service.g.dart';

@RestApi()
abstract class PoliticService {
  factory PoliticService(Dio dio, {String baseUrl}) = _PoliticService;

  @GET(PoliticUrl.accept)
  Future<void> acceptPolitic();
}

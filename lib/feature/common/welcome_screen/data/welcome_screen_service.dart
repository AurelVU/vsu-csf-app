import 'package:dio/dio.dart';
import 'package:fkn/feature/common/welcome_screen/data/welcome_screen_url.dart';

import 'package:retrofit/retrofit.dart';


part 'welcome_screen_service.g.dart';

@RestApi()
abstract class WelcomeScreenService {
  factory WelcomeScreenService(Dio dio, {String baseUrl}) = _WelcomeScreenService;

  @GET(WelcomeScreenUrl.example)
  Future<void> getExample();

  @POST(WelcomeScreenUrl.example)
  Future<void> postExample(
  // {
    // @Body() required Example example,
  // }
  );


}


import 'package:dio/dio.dart';
import 'package:fkn/feature/common/console/dto/console_parameter.dart';


import 'package:retrofit/retrofit.dart';


part 'console_service.g.dart';

@RestApi()
abstract class ConsoleService {
  factory ConsoleService(Dio dio, {String baseUrl}) = _ConsoleService;


  @GET('/console/global_parameters/')
  Future<List<ConsoleParameter>> getConsoleParameter();


}

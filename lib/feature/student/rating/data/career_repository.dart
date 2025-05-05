import 'package:fkn/domain/career/partner_info.dart';
import 'package:fkn/domain/profile/list_rating.dart';
import 'package:fkn/feature/student/rating/data/career_service.dart';

class CareerRepository {
  CareerRepository(this._service);

  final CareerService _service;

  Future<List<PartnerInfo>> getPartners() async {
    return Future.delayed(
        const Duration(seconds: 1),
        () => [
              PartnerInfo(
                  description: 'Fittin',
                  picture:
                      'https://sun9-34.userapi.com/impg/x_CAIQIuU5k1Wd0MeTWfMVXiXwJAqggqm5XzYw/YSyo5-lg9kA.jpg?size=256x64&quality=96&sign=56163dca5bbf623885c488eeda2dd0df&type=album'),
              PartnerInfo(
                  description: 'R3DS',
                  picture:
                      'https://sun9-7.userapi.com/impg/mICmrCC2SmJEANBef3bsPmQ721vgzJEgpsb6mA/uT4nXIM4U60.jpg?size=252x112&quality=96&sign=72ab83d89898f5f8c001bb23679d6d96&type=album'),
            ]);
  }

  Future<List<ListRating>?> getRatingByYearAndSemester({
    required int semester,
    required String year,
  }) async {
    final response =
        await _service.getStudentRating(semester: semester, year: year);
    return response.listRatings ;
  }
}

import 'package:dio/dio.dart';
import 'package:fkn/domain/event/error_event.dart';
import 'package:fkn/domain/profile/login_status.dart';
import 'package:fkn/domain/profile/result/semester_result.dart';
import 'package:fkn/domain/profile/result/subject_result.dart';
import 'package:fkn/domain/profile/student_rating.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/feature/student/profile/data/model/auth_request.dart';
import 'package:fkn/feature/student/profile/data/model/auth_response.dart';
import 'package:fkn/feature/student/profile/data/service/profile_service.dart';
import 'package:fkn/feature/teacher/teacher_profile/data/dto/token_free_request_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class IProfileRepository<T extends IUserData> {
  Future<T> updateProfileInfo({
    required T request,
  });

  Future<T> getProfileInfo({
    String? userIdentifier,
  });

  Future<bool> deleteProfileInfo();

  Future<void> getFreeToken();

  Future<AuthResponse> emailAndPasswordRequest(String email, String password);

  Future<LoginStatus> emailRequest(String email);

  Future<LoginStatus> phoneRequest(String phone);

  Future<StudentRating> getRating();
}

class ProfileRepository implements IProfileRepository<UserData> {
  ProfileRepository(this._service);

  final ProfileService _service;

  @override
  Future<bool> deleteProfileInfo() async {
    try {
      await _service.deleteStudentProfile();
      SharedPreferences.getInstance()
          .then((preference) => preference.setBool('requiredPolitics', true));
      return true;
    } on DioException {
      return false;
    }
  }

  @override
  Future<AuthResponse> emailAndPasswordRequest(
      String email, String password) async {
    try {
      final response = await _service.postAuthPasswordLogin(
          request: AuthRequest(username: email, password: password));
      return response;
    } on DioException catch (error) {
      throw ErrorEvent(
        name: 'login exception',
        message: error.error.toString(),
      );
      rethrow;
    }
    // return LoginStatus(
    //   isAuthorized: false,
    // );
  }

  @override
  Future<LoginStatus> emailRequest(String email) async {
    if (email == 'test_t_t') {
      return LoginStatus(
        loginRequired: true,
        isAuthorized: false,
      );
    }
    return LoginStatus(
      isAuthorized: false,
      loginRequired: false,
    );
  }

  @override
  Future<LoginStatus> phoneRequest(String phone) async {
    if (phone == '79999999999') {
      return LoginStatus(
        loginRequired: true,
        isAuthorized: false,
      );
    }
    return LoginStatus(
      isAuthorized: false,
      loginRequired: false,
    );
  }

  @override
  Future<UserData> getProfileInfo({String? userIdentifier}) async {
    try {
      final response = await _service.getStudentProfile();
      return UserData(
        name: response.fullName,
        group: response.group,
        studentCard: response.studentCard,
        course: response.course,
        acceptPolitics: response.acceptPolitic,
        subGroup: response.subGroup,
        results: response.terms
                ?.map(
                  (e) => SemesterResult(
                    number: e.numbers,
                    year: e.year,
                    results: e.marks
                            ?.map(
                              (e) => SubjectResult(
                                teacher: e.teacher,
                                att1: e.att1,
                                att2: e.att2,
                                att3: e.att3,
                                attendancePercent: e.attendancePercent,
                                exam: e.exam,
                                result: e.result,
                                subjectName: e.subjectName,
                                markType: e.markType,
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                )
                .toList() ??
            [],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserData> updateProfileInfo({required IUserData request}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> getFreeToken() async {
    try {
      final uuid = await _getUuid();
      await _service.postTokenFree(
        request: TokenFreeRequestDto(
          userUuid: uuid,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _getUuid() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    var uuid = sharedPreferences.getString('uuid');
    if (uuid == null) {
      uuid = const Uuid().v4();
      await sharedPreferences.setString('uuid', uuid);
    }
    return uuid;
  }

  @override
  Future<StudentRating> getRating() async {
    return await _service.getStudentRating();
  }
}

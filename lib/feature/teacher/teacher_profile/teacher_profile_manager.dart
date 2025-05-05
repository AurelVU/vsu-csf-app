import 'package:dio/dio.dart';
import 'package:fkn/domain/event/error_event.dart';
import 'package:fkn/domain/event/info_event.dart';
import 'package:fkn/domain/teacher/profile/teacher_info.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/data/model/auth_response.dart';
import 'package:fkn/feature/teacher/teacher_profile/data/teacher_profile_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherProfileManager extends LifecycleModule {
  TeacherProfileManager(
    this._teacherProfileRepository,
    this._eventBus,
  );

  @override
  Future<void> init() async {
    super.init();
    _checkAuthorizationState();
  }

  final IEventBus _eventBus;

  final BehaviorSubject<TeacherInfo?> teacherInfo = BehaviorSubject();

  final BehaviorSubject<bool> isLoggedIn = BehaviorSubject();

  final TeacherProfileRepository _teacherProfileRepository;

  final BehaviorSubject<String?> loginErrorController =
      BehaviorSubject.seeded(null);

  Future<void> loginAsTeacherByEmail(String email) async {
    try {
      loginErrorController.add(null);
      await _teacherProfileRepository.emailRequest(email);
    } on DioException catch (e) {
      loginErrorController.add(e.response?.data['message'] as String);
      rethrow;
    }
  }

  Future<void> updateUserData() async {
    if (isLoggedIn.valueOrNull == false) {
      return;
    }
    try {
      final userData = await _teacherProfileRepository.getTeacherInfo();
      teacherInfo.value = userData;
    } catch (exception) {
      rethrow;
    }
  }

  Future<AuthResponse> confirmCode(String email, String code) async {
    try {
      final response =
          await _teacherProfileRepository.confirmEmailCode(email, code);
      await _updateIsLoggined(true);
      // updateUserData();
      return response;
    } on ErrorEvent {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await updateFreeToken();
      teacherInfo.add(null);

      await _updateIsLoggined(false);
    } on ErrorEvent {
      rethrow;
    }
  }

  Future<void> deleteProfile() async {
    try {
      final status = await _teacherProfileRepository.deleteTeacherProfile();
      if (status) {
        logout();
        _eventBus.addEvent(InfoEvent(
          name: 'teacher deleted his account',
        ));
      }
    } on ErrorEvent catch (exception) {
      _eventBus.addEvent(exception);
      rethrow;
    } catch (unexpectedError) {
      _eventBus.addEvent(
        ErrorEvent(
          name: 'UnexpectedError',
          message: unexpectedError.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> updateFreeToken() async {
    await _teacherProfileRepository.getFreeToken();
    await _updateIsLoggined(false);
  }

  // REFACTOR: Требуется улучшить логику для корректной работы с несколькими ролями пользователя
  Future<void> _checkAuthorizationState() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.add(prefs.getBool('isLoggedIn') ?? false);
  }

  Future<void> _updateIsLoggined(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', value);
    isLoggedIn.add(value);
    FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    if (value) {
      storage.write(key: 'appType', value: 'teacher');
    } else {
      storage.delete(key: 'appType');
    }

    // prefs.setString('appType', isLoggedIn.value ? 'teacher' : '');
  }
}

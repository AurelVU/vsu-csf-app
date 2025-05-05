import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/utils/router_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../router/router.dart';
import '../../../startup/app_color.dart';

class PoliticWebViewScreenPresenter extends LifecycleModule {
  PoliticWebViewScreenPresenter({
    required this.isStudent,
    required this.teacherProfile,
    required this.url,
    required this.profile,
    required this.router,
  });

  final String url;
  final IProfile<UserData> profile;
  final TeacherProfileManager teacherProfile;
  final StackRouter router;
  final bool isStudent;
  final BehaviorSubject<bool> isLoading = BehaviorSubject.seeded(false);

  WebViewController? controller;

  @override
  void init() {
    super.init();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColor.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            debugPrint(error.description);
            router.pop(false);
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  Future<void> goNext() async {
    try {
      isLoading.value = true;
      if (isStudent) {
        await profile.updateUserData();
      } else {
        await teacherProfile.updateUserData();
      }
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.badResponse) {
        ///
        // FlutterSecureStorage storage = const FlutterSecureStorage(
        //   aOptions: AndroidOptions(
        //     encryptedSharedPreferences: true,
        //   ),
        // );
        // storage.write(key: 'appType', value: '');

        if (isStudent) {
          await profile.logout();
        } else {
          await teacherProfile.logout();
        }
        router.showErrorSnackBar('Вход в профиль недоступен из-за отсутствия согласия на поручение');
        await router.replace(AuthRoute());

        return;
      }
    }
    isLoading.value = false;
    if (isStudent) {
      router.replace(StudentHomeRoute());
    } else {
      router.replace(TeacherHomeRoute());
    }
  }
}

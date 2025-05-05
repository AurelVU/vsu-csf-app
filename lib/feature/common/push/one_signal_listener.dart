import 'dart:async';

import 'package:fkn/config/app_secrets.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalListener {
  static IProfile<UserData>? profile;

  static StreamSubscription? profileSubscription;

  static Future<void> init(IProfile<UserData> profile) async {
    OneSignalListener.profile = profile;

    OneSignal.Debug.setLogLevel(
      OSLogLevel.verbose,
    );

    OneSignal.initialize(oneSignalApiKey);

    OneSignal.Notifications.requestPermission(true);

    profileSubscription = profile.userData.listen((value) {
      final studentCard = value?.studentCard;
      if (studentCard != null) {
        OneSignal.User.addTagWithKey('student_id', studentCard);
      }
    });
  }

  static Future<void> dispose() async {
    await profileSubscription?.cancel();
  }
}

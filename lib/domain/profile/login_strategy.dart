

import 'login_status.dart';

abstract class ILoginStrategy {
  String get name;
  Future<LoginStatus> executeLogin();
}


import 'registration_status.dart';

abstract class IRegistrationStrategy {
  String get name;
  Future<RegistrationStatus> executeRegistration();
  bool get allowedAuthorized;
}

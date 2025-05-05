import 'package:auto_route/auto_route.dart';

extension DeeplinkHandler on StackRouter {


  Future<dynamic> navigateDeeplinkFromBanner(String deeplinkString) async {
    final deeplink = Uri.parse(deeplinkString);
    if (deeplink.pathSegments[0] == 'console-api') {
      final pageRoute = deeplink.pathSegments[1];
      await pushNamed('$pageRoute?${deeplink.query}');
    } else {

      await navigateNamed('${deeplink.path}?${deeplink.query}');
    }
  }


}

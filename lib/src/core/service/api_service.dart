import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';

// @lazySingleton
class AuthManager {
  bool useBasicAuth = false;

  // Change these when you want to use Basic Auth
  String? username;
  String? password;

  Map<String, String>? getBasicCredentials() {
    if (useBasicAuth && username != null && password != null) {
      return {'username': username!, 'password': password!};
    }
    return null;
  }

  // String? getToken() {
  //   if (!useBasicAuth) {
  //     // Return bearer token from storage or wherever
  //     return getIt<ICacheService>().read("bearer_token");
  //   }
  //   return null;
  // }
}

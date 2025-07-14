import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

abstract interface class AuthRepository {
  Future<Result<LoginResponseEntity>> login(
    LoginRequestEntity loginRequestEntity,
  );
  // Future<void> logout();
  // Future<bool> isLoggedIn();
  // Future<String?> getToken();
  // Future<void> saveToken(String token);
  // Future<void> clearToken();
}

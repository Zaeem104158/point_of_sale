import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestEntity loginRequestEntity,
  );
  // Future<void> logout();
  // Future<bool> isLoggedIn();
  // Future<String?> getToken();
  // Future<void> saveToken(String token);
  // Future<void> clearToken();
}

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/auth/data/model/login_request_model.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/auth/domain/repository/auth_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class Login
    implements
        UseCase<Either<Failure, LoginResponseEntity>, LoginRequestModel> {
  final AuthRepository _authRepository;

  Login(this._authRepository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity params) {
    return _authRepository.login(params);
  }
}

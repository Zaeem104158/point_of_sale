import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/repository/home_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class GetHomeMenus
    implements UseCase<List<HomeMenusResponseEntity>, LoginResponseEntity> {
  final HomeRepository _repository;

  GetHomeMenus(this._repository);

  @override
  Future<Result<List<HomeMenusResponseEntity>>> call(
    LoginResponseEntity loginResponseEntity,
  ) {
    return _repository.getHomeMenus(
      loginResponseEntity.comId!,
      loginResponseEntity.username!,
    );
  }
}

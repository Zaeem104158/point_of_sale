import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/notification_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/repository/notification_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class Notifications
    implements
        UseCase<Either<Failure, List<NotificationResponseEntity>>, LoginResponseEntity> {
  final NotificationRepository _repository;

  Notifications(this._repository);

  @override
  Future<Either<Failure, List<NotificationResponseEntity>>> call(LoginResponseEntity loginResponseEntity) {
    return _repository.getNotifications(loginResponseEntity.comId!,loginResponseEntity.username!);
  }
}

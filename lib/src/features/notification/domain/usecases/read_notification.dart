import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_request_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/repository/notification_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class ReadNotifications
    implements
        UseCase<Either<Failure, ReadNotificationResponseEntity>, ReadNotificationRequestEntity> {
  final NotificationRepository _repository;

  ReadNotifications(this._repository);

  @override
  Future<Either<Failure,ReadNotificationResponseEntity>> call(ReadNotificationRequestEntity readNotificationRequestEntity) {
    return _repository.readNotifications(readNotificationRequestEntity);
  }
}
import 'package:fpdart/fpdart.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/notification_response_entity.dart';

abstract interface class NotificationRepository {
  Future<Either<Failure, List<NotificationResponseEntity>>> getNotifications( int pComId,String pUsername);
}

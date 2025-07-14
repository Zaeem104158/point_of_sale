import 'package:point_of_sale/src/features/notification/domain/entity/notification_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_request_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_response_entity.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

abstract interface class NotificationRepository {
  Future<Result< List<NotificationResponseEntity>>> getNotifications( int pComId,String pUsername);
  Future<Result<ReadNotificationResponseEntity>> readNotifications(ReadNotificationRequestEntity readNotificationRequestEntity);
}

import 'package:equatable/equatable.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_request_entity.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotifications extends NotificationEvent {
  final LoginResponseEntity login;
  

  const LoadNotifications(this.login);

  @override
  List<Object?> get props => [login];
}

class ReadNotification extends NotificationEvent {
  final ReadNotificationRequestEntity readNotificationRequestEntity;
  

  const ReadNotification(this.readNotificationRequestEntity);

  @override
  List<Object?> get props => [readNotificationRequestEntity];
}

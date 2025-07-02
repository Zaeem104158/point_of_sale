import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/notification/domain/usecases/notifications.dart';
import 'package:point_of_sale/src/features/notification/domain/usecases/read_notification.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_event.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final Notifications _notificationsUseCase;
  final ReadNotifications _readNotifications;

  NotificationBloc(this._notificationsUseCase, this._readNotifications)
    : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<ReadNotification>(_onReadNotification);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());

    final result = await _notificationsUseCase(event.login);

    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (data) => emit(NotificationLoaded(data)),
    );
  }

  Future<void> _onReadNotification(
    ReadNotification event,
    Emitter<NotificationState> emit,
  ) async {
    final currentState = state;

    if (currentState is NotificationLoaded) {
      final result = await _readNotifications(
        event.readNotificationRequestEntity,
      );

      result.fold(
        (failure) {
          emit(NotificationError(failure.message));
        },
        (response) {
          // Create a new list where one item's status is updated
          final updatedList = currentState.notifications.map((notification) {
            if (notification.asnNotId ==
                event.readNotificationRequestEntity.pNotificationId) {
              return notification.copyWith(asnNotStatus: 1);
            }
            return notification;
          }).toList();
  
          emit(NotificationLoaded(updatedList));
        },
      );
    }
  }
}

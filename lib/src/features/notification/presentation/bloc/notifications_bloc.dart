import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sale/src/features/notification/domain/usecases/notifications.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_event.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final Notifications _notificationsUseCase;

  NotificationBloc(this._notificationsUseCase) : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());

    final result = await _notificationsUseCase.call(event.login);

    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (data) => emit(NotificationLoaded(data)),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final LoginRequestEntity requestEntity;

  const LoginSubmitted(this.requestEntity);

  @override
  List<Object?> get props => [requestEntity];
}

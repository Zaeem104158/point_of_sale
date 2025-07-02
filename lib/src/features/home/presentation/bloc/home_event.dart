import 'package:equatable/equatable.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeMenus extends HomeEvent {
  final LoginResponseEntity login;
  

  const LoadHomeMenus(this.login);

  @override
  List<Object?> get props => [login];
}

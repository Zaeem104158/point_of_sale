import 'package:equatable/equatable.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeMenusInitial extends HomeState {}

class HomeMenusLoading extends HomeState {}

class HomeMenusLoaded extends HomeState {
  final List<HomeMenusResponseEntity> homeMenus;

  const HomeMenusLoaded(this.homeMenus);

  @override
  List<Object?> get props => [homeMenus];
}

class HomeMenusError extends HomeState {
  final String message;

  const HomeMenusError(this.message);

  @override
  List<Object?> get props => [message];
}

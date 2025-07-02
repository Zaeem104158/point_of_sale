import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/home/domain/usecases/get_home_menus.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_event.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeMenus _usecase;

  HomeBloc(this._usecase) : super(HomeMenusInitial()) {
    on<LoadHomeMenus>(_onLoadHomeMenus);
  }

  Future<void> _onLoadHomeMenus(
    LoadHomeMenus event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeMenusLoading());

    final result = await _usecase(event.login);

    result.fold(
      (failure) => emit(HomeMenusError(failure.message)),
      (data) => emit(HomeMenusLoaded(data)),
    );
  }
}

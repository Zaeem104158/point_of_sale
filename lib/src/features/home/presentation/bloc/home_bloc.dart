import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/home/domain/usecases/get_company_news.dart';
import 'package:point_of_sale/src/features/home/domain/usecases/get_home_menus.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_event.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeMenus _homeMenus;
  final GetCompanyNews _companyNews;
  HomeBloc(this._homeMenus, this._companyNews) : super(const HomeState()) {
    on<LoadHomeMenus>(_onLoadHomeMenus);
    on<LoadCompanyNews>(_onLoadCompanyNewsList);
  }

  Future<void> _onLoadHomeMenus(
    LoadHomeMenus event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _homeMenus(event.login);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (menus) => emit(state.copyWith(menus: menus, isLoading: false)),
    );
  }

  Future<void> _onLoadCompanyNewsList(
    LoadCompanyNews event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _companyNews(event.login);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (news) => emit(state.copyWith(news: news, isLoading: false)),
    );
  }
}

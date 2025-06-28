import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/features/auth/domain/usercases/login_usercase.dart';
import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final result = await loginUseCase(event.requestEntity);

    await result.fold<Future<void>>(
      (failure) async {
        emit(LoginFailure(failure.message));
      },
      (response) async {
        // Store the token after successful login
        ICacheService cacheService = getIt<ICacheService>();
        await cacheService.write('bearer_token', "true");
        emit(LoginSuccess(response));
      },
    );
  }
}

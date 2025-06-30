import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:point_of_sale/app.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  FlutterNativeSplash.remove();
  runApp(
    MultiBlocProvider(
      providers: [
        // BlocProvider<LoginBloc>(
        //   create: (context) => LoginBloc(
        //     Login(AuthRepositoryImpl(AuthRemoteDataSource(getIt<Dio>()))),
        //   ), // assuming using GetIt
        // ),
        BlocProvider<LoginBloc>(create: (_) => getIt<LoginBloc>()),
        BlocProvider<NotificationBloc>(
          create: (_) => getIt<NotificationBloc>(),
        ),
      ],
      child: const App(),
    ),
  );
}

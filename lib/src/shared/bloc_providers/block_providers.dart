import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_bloc.dart';
import 'package:nested/nested.dart';
import 'package:point_of_sale/src/shared/theme/theme_cubit.dart';

List<SingleChildWidget> get blocProvidersList {
  return [
    // BlocProvider<LoginBloc>(
    //   create: (context) => LoginBloc(
    //     Login(AuthRepositoryImpl(AuthRemoteDataSource(getIt<Dio>()))),
    //   ), // assuming using GetIt
    // ),
    BlocProvider(create: (_)=> getIt<ThemeCubit>()),
    BlocProvider<LoginBloc>(create: (_) => getIt<LoginBloc>()),
    BlocProvider<NotificationBloc>(create: (_) => getIt<NotificationBloc>()),
    BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>()),
  ];
}

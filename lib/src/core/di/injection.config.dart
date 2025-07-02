// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i1022;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usercases/login_usercase.dart' as _i749;
import '../../features/auth/presentation/bloc/login_bloc.dart' as _i990;
import '../../features/home/data/datasources/remote/home_remote_datasource.dart'
    as _i410;
import '../../features/home/data/repository/home_repository_impl.dart' as _i9;
import '../../features/home/domain/repository/home_repository.dart' as _i541;
import '../../features/home/domain/usecases/get_home_menus.dart' as _i227;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i202;
import '../../features/notification/data/datasources/remote/notification_remote_datasource.dart'
    as _i882;
import '../../features/notification/data/repository/notification_repository_impl.dart'
    as _i341;
import '../../features/notification/domain/repository/notification_repository.dart'
    as _i1057;
import '../../features/notification/domain/usecases/notifications.dart'
    as _i190;
import '../../features/notification/domain/usecases/read_notification.dart'
    as _i36;
import '../../features/notification/presentation/bloc/notifications_bloc.dart'
    as _i65;
import '../../shared/widgets/loader_widget.dart' as _i516;
import '../route/app_page.dart' as _i900;
import '../service/cache_service.dart' as _i723;
import '../service/database_service.dart' as _i8;
import 'app_injection_module.dart' as _i975;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  await gh.factoryAsync<_i8.ObjectBoxService>(
    () => appModule.objectBoxService,
    preResolve: true,
  );
  gh.singleton<_i361.Dio>(() => appModule.basicDio());
  gh.lazySingleton<_i974.Logger>(() => appModule.logger);
  gh.lazySingleton<_i409.Widget>(() => appModule.loader);
  gh.lazySingleton<_i583.GoRouter>(() => appModule.router);
  gh.lazySingleton<_i900.AppPage>(() => _i900.AppPage());
  gh.lazySingleton<_i516.LoaderWidget>(() => _i516.LoaderWidget());
  gh.lazySingleton<_i1022.AuthRemoteDataSource>(
    () => _i1022.AuthRemoteDataSource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i882.NotificationRemoteDataSource>(
    () => _i882.NotificationRemoteDataSource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i410.HomeRemoteDatasource>(
    () => _i410.HomeRemoteDatasource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i1057.NotificationRepository>(
    () => _i341.NotificationRepositoryImpl(
      gh<_i882.NotificationRemoteDataSource>(),
    ),
  );
  gh.lazySingleton<_i723.ICacheService>(
    () => _i723.CacheService(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i541.HomeRepository>(
    () => _i9.HomeRepositoryImpl(gh<_i410.HomeRemoteDatasource>()),
  );
  gh.lazySingleton<_i190.Notifications>(
    () => _i190.Notifications(gh<_i1057.NotificationRepository>()),
  );
  gh.lazySingleton<_i36.ReadNotifications>(
    () => _i36.ReadNotifications(gh<_i1057.NotificationRepository>()),
  );
  gh.lazySingleton<_i961.AuthRepository>(
    () => _i409.AuthRepositoryImpl(gh<_i1022.AuthRemoteDataSource>()),
  );
  gh.lazySingleton<_i227.GetHomeMenus>(
    () => _i227.GetHomeMenus(gh<_i541.HomeRepository>()),
  );
  gh.factory<_i202.HomeBloc>(() => _i202.HomeBloc(gh<_i227.GetHomeMenus>()));
  gh.factory<_i65.NotificationBloc>(
    () => _i65.NotificationBloc(
      gh<_i190.Notifications>(),
      gh<_i36.ReadNotifications>(),
    ),
  );
  gh.lazySingleton<_i749.Login>(() => _i749.Login(gh<_i961.AuthRepository>()));
  gh.factory<_i990.LoginBloc>(() => _i990.LoginBloc(gh<_i749.Login>()));
  return getIt;
}

class _$AppModule extends _i975.AppModule {}

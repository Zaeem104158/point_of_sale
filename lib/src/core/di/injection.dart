import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/route/app_page.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<ICacheService>(
    () => CacheService(getIt<SharedPreferences>()),
  );

  // AppPage
  getIt.registerLazySingleton<AppPage>(() => AppPage());

  // GoRouter
  getIt.registerLazySingleton<GoRouter>(() => getIt<AppPage>().router);
}

// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
// import 'package:point_of_sale/src/core/di/injection.config.dart';

// final getIt = GetIt.instance;

// @injectableInit
// Future<void> configureDependencies() async => getIt.init();

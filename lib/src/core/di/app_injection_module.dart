import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route/app_page.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @lazySingleton
  GoRouter get router => getIt<AppPage>().router;
}

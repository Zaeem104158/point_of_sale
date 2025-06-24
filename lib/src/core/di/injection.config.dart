// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../route/app_page.dart' as _i900;
import '../service/cache_service.dart' as _i723;
import '../style/app_color.dart' as _i908;
import '../style/app_theme.dart' as _i991;
import 'modules/app_module.dart' as _i349;

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
  gh.lazySingleton<_i900.AppPage>(() => _i900.AppPage());
  gh.lazySingleton<_i908.AppColor>(() => _i908.AppColor());
  gh.lazySingleton<_i991.AppTheme>(() => _i991.AppTheme());
  gh.lazySingleton<_i583.GoRouter>(() => appModule.router);
  gh.lazySingleton<_i723.ICacheService>(
    () => _i723.CacheService(gh<_i460.SharedPreferences>()),
  );
  return getIt;
}

class _$AppModule extends _i349.AppModule {}

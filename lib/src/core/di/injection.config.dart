// // dart format width=80
// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // InjectableConfigGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:get_it/get_it.dart' as _i174;
// import 'package:injectable/injectable.dart' as _i526;
// import 'package:point_of_sale/src/core/di/modules/cache_inj_module.dart'
//     as _i695;
// import 'package:point_of_sale/src/core/di/modules/router_inj_module.dart'
//     as _i804;
// import 'package:point_of_sale/src/core/route/app_page.dart' as _i164;
// import 'package:point_of_sale/src/core/service/cache_service.dart' as _i4;
// import 'package:point_of_sale/src/core/style/app_color.dart' as _i175;
// import 'package:point_of_sale/src/core/style/app_theme.dart' as _i366;
// import 'package:shared_preferences/shared_preferences.dart' as _i460;

// extension GetItInjectableX on _i174.GetIt {
//   // initializes the registration of main-scope dependencies inside of GetIt
//   Future<_i174.GetIt> init({
//     String? environment,
//     _i526.EnvironmentFilter? environmentFilter,
//   }) async {
//     final gh = _i526.GetItHelper(this, environment, environmentFilter);
//     final injectionModule = _$InjectionModule();
//     await gh.factoryAsync<_i460.SharedPreferences>(
//       () => injectionModule.prefs,
//       preResolve: true,
//     );
//     gh.lazySingleton<_i164.AppPage>(() => _i164.AppPage());
//     gh.lazySingleton<_i366.AppTheme>(() => _i366.AppTheme());
//     gh.lazySingleton<_i175.AppColor>(() => _i175.AppColor());
//     gh.lazySingleton<_i804.RouterModule>(() => _i804.RouterModule());
//     gh.lazySingleton<_i4.ICacheService>(
//       () => _i4.CacheService(gh<_i460.SharedPreferences>()),
//     );
//     return this;
//   }
// }

// class _$InjectionModule extends _i695.InjectionModule {}

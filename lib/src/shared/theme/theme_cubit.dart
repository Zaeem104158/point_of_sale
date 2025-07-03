import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  final ICacheService cache;

  ThemeCubit(this.cache) : super(_getInitialTheme(cache));

  static ThemeMode _getInitialTheme(ICacheService cache) {
    final themeValue = cache.read(LocalCacheKeys.theme);
    switch (themeValue) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void setTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        cache.write(LocalCacheKeys.theme, 'light');
        emit(ThemeMode.light);
        break;
      case ThemeMode.dark:
        cache.write(LocalCacheKeys.theme, 'dark');
        emit(ThemeMode.dark);
        break;
      case ThemeMode.system:
        cache.write(LocalCacheKeys.theme, 'system');
        emit(ThemeMode.system);
        break;
    }
  }
}

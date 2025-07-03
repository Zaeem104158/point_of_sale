import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/style/app_theme.dart';
import 'package:point_of_sale/src/shared/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: Size(constraints.maxWidth, constraints.maxHeight),
          minTextAdapt: true,
          splitScreenMode: true,
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            bloc:
                getIt<ThemeCubit>(), // Use getIt or context.read<ThemeCubit>()
            builder: (context, themeMode) {
              return MaterialApp.router(
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode, // <-- rebuilds when ThemeCubit emits
                routerConfig: getIt<GoRouter>(),
              );
            },
          ),
        );
      },
    );
  }
}

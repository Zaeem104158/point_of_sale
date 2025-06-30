import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/style/app_theme.dart';

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
          child: MaterialApp.router(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            routerConfig: getIt<GoRouter>(),
          ),
        );
      },
    );
  }
}

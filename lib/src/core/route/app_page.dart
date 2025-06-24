import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/shared/widgets/screen_wrapper.dart';
part 'routes.dart';

@lazySingleton
class AppPage {
  late ICacheService cacheService;
  late List<RouteBase> routes;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  late GoRouter router;

  AppPage() {
    cacheService = getIt<ICacheService>();
    final token = cacheService.read('bearer_token');

    routes = [
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text("Login"))),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => ScreenWrapper(child: child),
        routes: [
          GoRoute(
            path: Routes.notifications.path,
            name: Routes.notifications.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: Scaffold(body: Center(child: Text("Notification"))),
            ),
          ),
          GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: Scaffold(body: Center(child: Text("Home"))),
            ),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: Scaffold(body: Center(child: Text("Profile"))),
            ),
          ),
        ],
      ),
    ];

    router = GoRouter(
      navigatorKey: navigatorKey,
      routes: routes,
      initialLocation: token == null ? Routes.login.path : Routes.home.path,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/core/service/database_service.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/auth/presentation/pages/login_page.dart';
import 'package:point_of_sale/src/features/home/presentation/pages/home_page.dart';
import 'package:point_of_sale/src/features/notification/presentation/pages/notification_page.dart';
import 'package:point_of_sale/src/features/onboarding/onboarding_page.dart';
import 'package:point_of_sale/src/features/profile/presentation/profile_page.dart';
import 'package:point_of_sale/src/features/splash/splash_page.dart';
import 'package:point_of_sale/src/shared/widgets/layout_scaffold.dart';
part 'routes.dart';

@lazySingleton
class AppPage {
  late ICacheService cacheService;
  late List<RouteBase> routes;
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  late GoRouter router;

  AppPage() {
    cacheService = getIt<ICacheService>();
    final token = cacheService.read('bearer_token');

    routes = [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        pageBuilder: (context, state) => MaterialPage(
          child: SplashPage(rootNavigatorKey: _rootNavigatorKey, token: token),
        ),
      ),
      GoRoute(
        path: Routes.onBoarding.path,
        name: Routes.onBoarding.name,
        pageBuilder: (context, state) => MaterialPage(
          child: OnboardingScreen(rootNavigatorKey: _rootNavigatorKey),
        ),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return LayoutScaffold(navigationShell: navigationShell);
        },
        branches: [
          //notification branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.notifications.path,
                name: Routes.notifications.name,
                pageBuilder: (context, state) {
                  final store = getIt<ObjectBoxService>().store;
                  final loginResponseBox = store.box<LoginResponseEntity>();
                  final loginResponseData = loginResponseBox.getAll();
                  return MaterialPage(
                    child: NotificationPage(login: loginResponseData.first),
                  );
                },
              ),
            ],
          ),
          // home branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home.path,
                name: Routes.home.name,
                pageBuilder: (context, state) =>
                    MaterialPage(child: HomePage()),
              ),
            ],
          ),
          // profile branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile.path,
                name: Routes.profile.name,
                pageBuilder: (context, state) =>
                    MaterialPage(child: ProfilePage()),
                routes: [
                  GoRoute(
                    path: Routes.settings.path,
                    name: Routes.settings.name,
                    pageBuilder: (context, state) => MaterialPage(
                      child: Scaffold(
                        appBar: AppBar(title: Text("Settings")),
                        body: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // context.pushNamed(Routes.about.name);
                              context.pop(true);
                            },
                            child: Text("Goto About"),
                          ),
                        ),
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.about.path,
                        name: Routes.about.name,
                        pageBuilder: (context, state) => MaterialPage(
                          child: Scaffold(
                            appBar: AppBar(title: Text("About")),
                            body: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.pushNamed(Routes.payBill.name);
                                },
                                child: Text("Goto Paybill"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.payBill.path,
        name: Routes.payBill.name,
        pageBuilder: (context, state) => MaterialPage(
          child: Scaffold(
            appBar: AppBar(title: Text(" Paybill")),
            body: Center(child: Text("Paybill")),
          ),
        ),
      ),
    ];

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: routes,
      // initialLocation: token == null ? Routes.login.path : Routes.home.path,
    );
  }
}
























/* 
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
            pageBuilder: (context, state) => MaterialPage(child: HomePage()),
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
*/
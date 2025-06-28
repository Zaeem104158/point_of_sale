import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/asset_service.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/features/auth/presentation/pages/login_page.dart';
import 'package:point_of_sale/src/features/home/presentation/pages/home_page.dart';
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
                pageBuilder: (context, state) => const MaterialPage(
                  child: Scaffold(body: Center(child: Text("Notification"))),
                ),
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
                pageBuilder: (context, state) => MaterialPage(
                  child: Scaffold(
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Profile"),
                        ElevatedButton(
                          onPressed: () {
                            context.pushNamed(Routes.settings.name);
                          },
                          child: Center(child: Text("Goto Settings")),
                        ),
                      ],
                    ),
                  ),
                ),
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
                              context.goNamed(Routes.about.name);
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
      // ShellRoute(
      //   builder: (context, state, child) => ScreenWrapper(child: child),
      //   routes: [
      // GoRoute(
      //   path: Routes.notifications.path,
      //   name: Routes.notifications.name,
      //   pageBuilder: (context, state) => const MaterialPage(
      //     child: Scaffold(body: Center(child: Text("Notification"))),
      //   ),
      // ),
      //     GoRoute(
      //       path: Routes.home.path,
      //       name: Routes.home.name,
      //       pageBuilder: (context, state) => MaterialPage(child: HomePage()),
      //     ),
      //     GoRoute(
      //       path: Routes.profile.path,
      //       name: Routes.profile.name,
      //       pageBuilder: (context, state) => const MaterialPage(
      //         child: Scaffold(body: Center(child: Text("Profile"))),
      //       ),
      //     ),
      //   ],
      // ),
    ];

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: routes,
      initialLocation: token == null ? Routes.login.path : Routes.home.path,
    );
  }
}

class LayoutScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutScaffold({Key? key, required this.navigationShell})
    : super(key: key ?? const Key('LayoutScaffold'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: AppColor.primary,
        destinations: destination
            .map(
              (dest) => NavigationDestination(
                icon: dest.icon,
                selectedIcon: dest.selectedIcon,
                label: dest.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class Destination {
  const Destination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
  final Widget icon;
  final Image selectedIcon;
  final String label;
}

final destination = <Destination>[
  Destination(
    icon: Center(
      child: Image.asset(AssetsService.homeLight, height: 20, width: 20),
    ),
    selectedIcon: Image.asset(AssetsService.homeDark, height: 20, width: 20),
    label: 'Home',
  ),
  Destination(
    icon: Image.asset(AssetsService.notificationLight, height: 20, width: 20),
    selectedIcon: Image.asset(
      AssetsService.notificationDark,
      height: 20,
      width: 20,
    ),
    label: 'Notifications',
  ),
  Destination(
    icon: Image.asset(AssetsService.profileLight, height: 20, width: 20),
    selectedIcon: Image.asset(AssetsService.profileDark, height: 20, width: 20),
    label: 'Profile',
  ),
];

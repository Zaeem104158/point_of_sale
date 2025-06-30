import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/route/app_page.dart';
import 'package:point_of_sale/src/core/service/asset_service.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required this.token,
  }) : _rootNavigatorKey = rootNavigatorKey;

  final GlobalKey<NavigatorState> _rootNavigatorKey;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      // onInit: () {
      //   debugPrint("On Init");
      // },
      onEnd: () async {
        final cacheService = getIt<ICacheService>();
        final isOnboardingComplete = await cacheService.read('onboarding');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_rootNavigatorKey.currentContext == null) return;
          if (token == null) {
            if (isOnboardingComplete == null) {
              _rootNavigatorKey.currentContext!.goNamed(Routes.onBoarding.name);
            } else {
              _rootNavigatorKey.currentContext!.goNamed(Routes.login.name);
            }
          } else {
            if (isOnboardingComplete == null) {
              _rootNavigatorKey.currentContext!.goNamed(Routes.onBoarding.name);
            } else {
              _rootNavigatorKey.currentContext!.goNamed(Routes.home.name);
            }
          }
        });
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset(AssetsService.appIcon),
      ),
      //onAnimationEnd: () =>
      // nextScreen: const MyHomePage(),
    );
  }
}

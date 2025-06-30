import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/route/app_page.dart';
import 'package:point_of_sale/src/core/service/asset_service.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required GlobalKey<NavigatorState> rootNavigatorKey,
  }) : _rootNavigatorKey = rootNavigatorKey;

  final GlobalKey<NavigatorState> _rootNavigatorKey;

  void _onIntroEnd(BuildContext context) async {
    final cacheService = getIt<ICacheService>();
    await cacheService.write('onboarding', "true");

    final token = await cacheService.read('bearer_token');
    if (token == null) {
      _rootNavigatorKey.currentContext!.goNamed(Routes.login.name);
    } else {
      _rootNavigatorKey.currentContext!.goNamed(Routes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: const TextStyle(fontSize: 16.0),
      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
      imagePadding: const EdgeInsets.all(16),
      pageColor: Colors.transparent,
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Point Of Sale",
          body: "Get instant crypto news and market trends in short format.",
          image: Image.asset(AssetsService.onboarding1, height: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Stay Updated",
          body: "Receive live notifications for breaking crypto news.",
          image: Image.asset(AssetsService.onboarding2, height: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Track Insights",
          body: "Analyze insights, polls, and news easily.",
          image: Image.asset(AssetsService.onboarding3, height: 100),
          decoration: pageDecoration,
          footer: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44.0),
            child: ElevatedButton(
              onPressed: () => _onIntroEnd(context),
              child: const Text("Get Started"),
            ),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(8, 8),
        color: Colors.grey,
        activeSize: Size(24, 8),
        activeColor: AppColor.primary,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

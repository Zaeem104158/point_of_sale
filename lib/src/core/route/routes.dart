part of 'app_page.dart';

final class Route {
  final String name;
  final String path;
  const Route(this.name, this.path);
}

final class Routes {
  static const Route splash = Route('splash', '/');
  static const Route onBoarding = Route('onboarding', '/onboarding');
  static const Route home = Route('home', '/home');
  static const Route notifications = Route('search', '/search');
  static const Route profile = Route('profile', '/profile');
  static const Route settings = Route('settings', 'settings');
  static const Route about = Route('about', 'about');
  static const Route login = Route('login', '/login');
  static const Route payBill = Route('payBill', '/paybill');
}




  // static const Route LEADERBOARD = Route('leaderboard', '/quiz/leaderboard');
  // static const Route START_QUIZ = Route('startQuiz', '/quiz/startQuiz');
  // static const Route COMPLETE_QUIZ = Route(
  //   'completeQuiz',
  //   '/quiz/startQuiz/completeQuiz',
  // );
part of 'app_page.dart';

final class Route {
  final String name;
  final String path;
  const Route(this.name, this.path);
}

final class Routes {
  static const Route home = Route('home', '/');
  static const Route notifications = Route('search', '/search');
  static const Route profile = Route('profile', '/profile');
  static const Route login = Route('login', '/login');
}




  // static const Route LEADERBOARD = Route('leaderboard', '/quiz/leaderboard');
  // static const Route START_QUIZ = Route('startQuiz', '/quiz/startQuiz');
  // static const Route COMPLETE_QUIZ = Route(
  //   'completeQuiz',
  //   '/quiz/startQuiz/completeQuiz',
  // );
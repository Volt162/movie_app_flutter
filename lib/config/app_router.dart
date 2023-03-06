import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');
    switch (settings.name) {
      case MovieListScreen.routeName:
        return MovieListScreen.route();
      case MovieDetailsScreen.routeName:
        List<Object?> mass = (settings.arguments as Set<Object?>).toList();
        return MovieDetailsScreen.route(
            index: int.parse(mass[0].toString()),
            poster: mass[1].toString(),
            backImage: mass[2].toString(),
            title: mass[3].toString());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Error')),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}

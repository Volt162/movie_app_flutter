import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');
    switch (settings.name) {
      case MovieListScreen.routeName:
        return MovieListScreen.route();
      case MovieDetailsScreen.routeName:
        return MovieDetailsScreen
            .route(index: int.parse(settings.arguments.toString()));

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

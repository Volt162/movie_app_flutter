import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_flutter/config/app_router.dart';
import 'package:movie_app_flutter/config/theme.dart';
import 'package:movie_app_flutter/screens/movie_list/movie_list_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: const MovieListScreen(),
    );
  }
}

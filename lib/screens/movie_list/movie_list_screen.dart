import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/widgets.dart';

class MovieListScreen extends StatelessWidget {
  static const String routeName = '/movie_list';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const MovieListScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Movie list'),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: 10,
          prototypeItem: const MovieCard(index:-1),
          itemBuilder: (context, index) {
            return MovieCard(index: index);
          },
        ));
  }
}

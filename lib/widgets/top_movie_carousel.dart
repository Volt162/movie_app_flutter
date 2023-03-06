import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/widgets/widgets.dart';

class TopMovieCarousel extends StatelessWidget {
  const TopMovieCarousel({
    super.key,
    required topMovies
  }) : _topMovies = topMovies;

  final List<MovieItem?> _topMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _topMovies.length,
        itemBuilder: (context, index) {
          return TopMovieCard(id: _topMovies[index]!.id!, movie: _topMovies[index]);
        },
      ),
    );
  }
}
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/models/movie/movie_item.dart';

class MovieList extends Equatable {
  final List<MovieItem?>? movies;

  const MovieList({this.movies = const <MovieItem>[]});

  @override
  List<Object?> get props => [movies];
}

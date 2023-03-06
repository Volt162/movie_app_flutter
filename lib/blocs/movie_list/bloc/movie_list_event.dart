part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class StartMovieList extends MovieListEvent {}

class RefreshMovieList extends MovieListEvent {
  const RefreshMovieList(this.firstPageMovies);

  final MovieList firstPageMovies;

  @override
  List<Object> get props => [firstPageMovies];
}

class LoadMoreMovieList extends MovieListEvent {
  const LoadMoreMovieList(this.newListMovies);

  final MovieList newListMovies;

  @override
  List<Object> get props => [newListMovies];
}

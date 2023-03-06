part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  final bool isRefresh;
  final MovieList movieList;
  final int totalMovieListLength;

  const MovieListLoaded(
      {this.totalMovieListLength = 0,
      this.isRefresh = false,
      this.movieList = const MovieList()});

  MovieListLoaded copyWith({
     bool? isRefresh,
     MovieList? movieList,
     int? totalMovieListLength,
  }) {
    return MovieListLoaded(
      isRefresh: isRefresh ?? this.isRefresh,
      movieList: movieList ?? this.movieList,
      totalMovieListLength: totalMovieListLength ?? this.totalMovieListLength,
    );
  }

  @override
  List<Object> get props => [totalMovieListLength, movieList, isRefresh];
}

class MovieListError extends MovieListState {}

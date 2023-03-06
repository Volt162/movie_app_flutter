part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {}

class MovieListsLoaded extends MovieListState {
  final bool isRefresh;
  final MovieList topMovieList;
  final MovieList popularMovieList;
  final int totalMovieListLength;

  const MovieListsLoaded(
      {this.totalMovieListLength = 0,
      this.isRefresh = false,
      this.popularMovieList = const MovieList(),
      this.topMovieList = const MovieList()});

  MovieListsLoaded copyWith({
    bool? isRefresh,
    MovieList? popularMovieList,
    MovieList? topMovieList,
    int? totalMovieListLength,
  }) {
    return MovieListsLoaded(
      isRefresh: isRefresh ?? this.isRefresh,
      popularMovieList: popularMovieList ?? this.popularMovieList,
      topMovieList: topMovieList ?? this.topMovieList,
      totalMovieListLength: totalMovieListLength ?? this.totalMovieListLength,
    );
  }

  @override
  List<Object> get props => [totalMovieListLength, popularMovieList, topMovieList, isRefresh];
}

class MovieListError extends MovieListState {}

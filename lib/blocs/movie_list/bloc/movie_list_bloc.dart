import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/services/movie/imovie_service.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final IMovieService _movieService;
  int page = 1;

  MovieListBloc({required movieService})
      : _movieService = movieService,
        super(MovieListLoading()) {
    on<StartMovieList>(_onStartMovieList);
    on<RefreshMovieList>(_onRefreshMovieList);
    on<LoadMoreMovieList>(_onLoadMoreMovieList);
  }

  FutureOr<void> _onStartMovieList(
      StartMovieList event, Emitter<MovieListState> emit) async {
    emit(MovieListLoading());
    try {
      final response = await _movieService.getPopularMovies(page);
      page++;
      if (response.status == Status.SUCCESS) {
        var movies = response.data!.results;
        var length = response.data!.totalresults;
        emit(MovieListLoaded(
            movieList: MovieList(movies: movies),
            totalMovieListLength: length!));
      } else {
        emit(const MovieListLoaded());
      }
    } catch (e) {
      emit(const MovieListLoaded());
    }
  }

  FutureOr<void> _onRefreshMovieList(
      RefreshMovieList event, Emitter<MovieListState> emit) {
    if (event.firstPageMovies.movies!.isNotEmpty) {
      var s = state as MovieListLoaded;
      emit(s.copyWith(
          movieList: MovieList(movies: event.firstPageMovies.movies),
          isRefresh: true));
    } else {
      emit(state);
    }
  }

  FutureOr<void> _onLoadMoreMovieList(
      LoadMoreMovieList event, Emitter<MovieListState> emit) {
    if (event.newListMovies.movies!.isNotEmpty) {
      var s = state as MovieListLoaded;
      emit(s.copyWith(
          movieList: MovieList(movies: event.newListMovies.movies),
          isRefresh: false));
    } else {
      emit(state);
    }
  }

  Future<void> refreshList() async {
    try {
      final response = await _movieService.getPopularMovies(1);
      if (response.status == Status.SUCCESS) {
        var movies = response.data!.results;
        add(RefreshMovieList(MovieList(movies: movies)));
        page = 2;
      } else {
        add(RefreshMovieList(MovieList(movies: const MovieList().movies)));
      }
    } catch (e) {
      add(LoadMoreMovieList(MovieList(movies: const MovieList().movies)));
    }
  }

  Future<bool> loadMore() async {
    bool result = false;
    try {
      final response = await _movieService.getPopularMovies(page);
      if (response.status == Status.SUCCESS) {
        var movies = response.data!.results;
        add(LoadMoreMovieList(MovieList(movies: movies)));
        if (kDebugMode) {
          print('======== page: $page');
        }
        page++;
        result = true;
      } else {
        add(LoadMoreMovieList(MovieList(movies: const MovieList().movies)));
      }
    } catch (e) {
      add(LoadMoreMovieList(MovieList(movies: const MovieList().movies)));
    }
    return result;
  }
}

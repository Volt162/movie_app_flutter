import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/services/services.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final IMovieService _movieService;

  MovieDetailsBloc({required movieService})
      : _movieService = movieService,
        super(MovieDetailsLoading()) {
    on<StartMovieDetails>(_onStartMovieDetails);
  }

  FutureOr<void> _onStartMovieDetails(event, emit) async {
    emit(MovieDetailsLoading());
    try {
      final response = await _movieService.getMovieDetails(event.id);
      if (response.status == Status.SUCCESS) {
        var company = response.data;
        emit(MovieDetailsLoaded(company!));
      } else {
        emit(MovieDetailsError());
      }
    } catch (e) {
      emit(MovieDetailsError());
    }
  }
}

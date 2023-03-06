part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class StartMovieDetails extends MovieDetailsEvent {
  const StartMovieDetails(this.id);

  final int id;
}

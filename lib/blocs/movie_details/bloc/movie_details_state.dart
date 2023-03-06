part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsModel details;

  const MovieDetailsLoaded(this.details);

  @override
  List<Object> get props => [details];
}

class MovieDetailsError extends MovieDetailsState {}

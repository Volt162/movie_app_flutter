import 'package:movie_app_flutter/models/models.dart';

abstract class IMovieService {
  Future<ApiResponse<MovieListPage>> getPopularMovies(int page);
  Future<ApiResponse<MovieDetailsModel>> getMovieDetails(int id);
  Future<ApiResponse<MovieListPage>> getRatedMovies(int page);
}
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../models/models.dart';
import '../services.dart';

class MovieService implements IMovieService {
  MovieService(IRestService resolve) : _restService = resolve;

  final IRestService _restService;

  @override
  Future<ApiResponse<MovieListPage>> getPopularMovies(int page) async {
    const path = '/3/movie/popular';
    ApiResponse<MovieListPage> apiResponse;

    final response = await _restService.get(path, {'page': page.toString()});
    if (response.status == Status.SUCCESS) {
      final list = response.data as Map<String, dynamic>;

      var result = MovieListPage.fromJson(list);
      
      apiResponse = ApiResponse<MovieListPage>.success(result);
    } else {
      apiResponse = ApiResponse<MovieListPage>.failure(response.message);
    }

    if (kDebugMode) {
      print(apiResponse);
    }
    return apiResponse;
  }

  @override
  Future<ApiResponse<MovieListPage>> getRatedMovies(int page) async {
    const path = '/3/movie/top_rated';
    ApiResponse<MovieListPage> apiResponse;

    final response = await _restService.get(path, {'page': page.toString()});
    if (response.status == Status.SUCCESS) {
      final list = response.data as Map<String, dynamic>;

      var result = MovieListPage.fromJson(list);
      
      apiResponse = ApiResponse<MovieListPage>.success(result);
    } else {
      apiResponse = ApiResponse<MovieListPage>.failure(response.message);
    }

    if (kDebugMode) {
      print(apiResponse);
    }
    return apiResponse;
  }
  
  @override
  Future<ApiResponse<MovieDetailsModel>> getMovieDetails(int id) async {
    String path = '/3/movie/$id';
    ApiResponse<MovieDetailsModel> apiResponse;

    final response = await _restService.get(path, null);
    if (response.status == Status.SUCCESS) {
      final list = response.data as Map<String, dynamic>;

      var result = MovieDetailsModel.fromJson(list);
      
      apiResponse = ApiResponse<MovieDetailsModel>.success(result);
    } else {
      apiResponse = ApiResponse<MovieDetailsModel>.failure(response.message);
    }

    if (kDebugMode) {
      print(apiResponse);
    }
    return apiResponse;
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/models/api_responce.dart';
import 'package:movie_app_flutter/services/rest/irest_service.dart';

class RestService implements IRestService {
  RestService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'api.themoviedb.org';
  static const Map<String, String> _apiKey = {
    'api_key': 'f44c557ceaab5efc7785840524e678c9'
  };

  final http.Client _httpClient;

  @override
  Future<ApiResponse> get(String path, Map<String, String>? param) async {
    param != null ? param.addAll(_apiKey) : _apiKey;
    var requestParam = param;

    ApiResponse apiResponse = ApiResponse.loading('request: $path');
    if (kDebugMode) {
      print(apiResponse);
    }

    final request = Uri.https(
      _baseUrl,
      path,
      param = requestParam ?? _apiKey,
    );

    try {
      final reesponse = await _httpClient.get(request);

      if (reesponse.statusCode == 200) {
        final json = jsonDecode(
          reesponse.body,
        );

        if (json.isEmpty) {
          apiResponse = ApiResponse.failure('empty JSON');
        } else {
          apiResponse = ApiResponse.success(json);
        }
      } else {
        apiResponse = ApiResponse.failure('request: $path was failed!');
      }
      return apiResponse;
    } on HttpException {
      return ApiResponse.failure('No Internet Connection');
    } on SocketException {
      return ApiResponse.failure('No Internet Connection');
    } on FormatException {
      return ApiResponse.failure('Invalid Format');
    } catch (e) {
      return ApiResponse.failure('Unknown Error');
    }
  }
}

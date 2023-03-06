import 'package:movie_app_flutter/models/models.dart';

abstract class IRestService {
  Future<ApiResponse> get(String path, Map<String, String>? param);
}
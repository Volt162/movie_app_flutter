import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'movie_list_page.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieListPage {
  int? page;
  List<MovieItem?>? results;
  int? totalpages;
  int? totalresults;

  MovieListPage({this.page, this.results, this.totalpages, this.totalresults});
  
  factory MovieListPage.fromJson(Map<String, dynamic> json) =>
      _$MovieListPageFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListPageToJson(this);
}

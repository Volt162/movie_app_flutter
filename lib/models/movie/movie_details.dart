import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_flutter/models/models.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetailsModel {
  bool? adult;
  String? backdroppath;
  int? budget;
  String? overview;
  List<ProductionCompany?>? productioncompanies;
  String? tagline;
  String? title;
  double? voteaverage;

  MovieDetailsModel(
      {this.adult,
      this.backdroppath,
      this.budget,
      this.overview,
      this.productioncompanies,
      this.tagline,
      this.title,
      this.voteaverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}

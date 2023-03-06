import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  String? backdroppath;
  int? id;
  String? originaltitle;
  String? overview;
  String? posterpath;
  String? releasedate;
  String? title;

  MovieItem(
      {this.backdroppath,
      this.id,
      this.originaltitle,
      this.overview,
      this.posterpath,
      this.releasedate,
      this.title});

  factory MovieItem.fromJson(Map<String, dynamic> json) => _$MovieItemFromJson(json);
  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}

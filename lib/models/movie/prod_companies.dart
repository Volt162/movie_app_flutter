import 'package:json_annotation/json_annotation.dart';

part 'prod_companies.g.dart';

@JsonSerializable()
class ProductionCompany {
  int? id;
  String? logopath;
  String? name;
  String? origincountry;

  ProductionCompany({this.id, this.logopath = 'assets/images/movie_logo.png', this.name, this.origincountry});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

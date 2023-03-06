import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/models/movie/prod_companies.dart';

class ProdCompanyList extends Equatable {
  final List<ProductionCompany?>? companies;

  const ProdCompanyList({this.companies = const <ProductionCompany>[]});

  @override
  List<Object?> get props => [companies];
}
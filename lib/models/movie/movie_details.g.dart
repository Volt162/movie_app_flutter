// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      adult: json['adult'] as bool?,
      backdroppath: json['backdrop_path'] as String?,
      budget: json['budget'] as int?,
      overview: json['overview'] as String?,
      productioncompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      voteaverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdroppath': instance.backdroppath,
      'budget': instance.budget,
      'overview': instance.overview,
      'productioncompanies':
          instance.productioncompanies?.map((e) => e?.toJson()).toList(),
      'tagline': instance.tagline,
      'title': instance.title,
      'voteaverage': instance.voteaverage,
    };

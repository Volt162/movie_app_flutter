// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prod_companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      id: json['id'] as int?,
      logopath: json['logo_path'] as String? ?? 'https://image.tmdb.org/t/p/w200/8lvHyhjr8oUKOOy2dKXoALWKdp0.png',
      name: json['name'] as String?,
      origincountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logopath': instance.logopath,
      'name': instance.name,
      'origincountry': instance.origincountry,
    };

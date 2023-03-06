// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListPage _$MovieListPageFromJson(Map<String, dynamic> json) =>
    MovieListPage(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : MovieItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalpages: json['total_pages'] as int?,
      totalresults: json['total_results'] as int?,
    );

Map<String, dynamic> _$MovieListPageToJson(MovieListPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
      'totalpages': instance.totalpages,
      'totalresults': instance.totalresults,
    };

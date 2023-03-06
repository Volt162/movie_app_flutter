// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItem _$MovieItemFromJson(Map<String, dynamic> json) => MovieItem(
      backdroppath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originaltitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterpath: json['poster_path'] as String?,
      releasedate: json['release_date'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
      'backdroppath': instance.backdroppath,
      'id': instance.id,
      'originaltitle': instance.originaltitle,
      'overview': instance.overview,
      'posterpath': instance.posterpath,
      'releasedate': instance.releasedate,
      'title': instance.title,
    };

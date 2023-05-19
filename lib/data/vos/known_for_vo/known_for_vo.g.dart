// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_for_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownForVO _$KnownForVOFromJson(Map<String, dynamic> json) => KnownForVO(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      mediaType: json['media_type'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      firstAirDate: json['first_air_date'] as String?,
      name: json['name'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalName: json['original_name'] as String?,
    );

Map<String, dynamic> _$KnownForVOToJson(KnownForVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'first_air_date': instance.firstAirDate,
      'name': instance.name,
      'origin_country': instance.originCountry,
      'original_name': instance.originalName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGenresResponse _$MovieGenresResponseFromJson(Map<String, dynamic> json) =>
    MovieGenresResponse(
      (json['genres'] as List<dynamic>?)
          ?.map((e) => MovieGenresVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieGenresResponseToJson(
        MovieGenresResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

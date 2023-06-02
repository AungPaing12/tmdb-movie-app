// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genres_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGenresVO _$MovieGenresVOFromJson(Map<String, dynamic> json) =>
    MovieGenresVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isSelect: json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieGenresVOToJson(MovieGenresVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelect': instance.isSelect,
    };

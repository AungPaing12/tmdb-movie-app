import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/movie_genres_vo/movie_genres_vo.dart';
part 'movie_genres_response.g.dart';
@JsonSerializable()
class MovieGenresResponse {

  @JsonKey(name: 'genres')
  List<MovieGenresVO>? genres;

  MovieGenresResponse(this.genres);

  factory MovieGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieGenresResponseFromJson(json);
}
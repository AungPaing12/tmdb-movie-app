import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';

part 'popular_movie_response.g.dart';
@JsonSerializable()
class PopularMovieResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<PopularMovieResultsVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  PopularMovieResponse({this.page, this.results, this.totalPages, this.totalResults});

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseFromJson(json);
}
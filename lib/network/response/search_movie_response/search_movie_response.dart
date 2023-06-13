import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo/result_vo.dart';

part 'search_movie_response.g.dart';

@JsonSerializable()
class SearchMovieResponse {
  @JsonKey(name: 'name')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchMovieResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseFromJson(json);
}

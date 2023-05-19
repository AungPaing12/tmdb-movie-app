import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/movie_vo/result_vo.dart';

part 'top_rated_response.g.dart';

@JsonSerializable()
class TopRatedResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  TopRatedResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory TopRatedResponse.fromJson(Map<String, dynamic> json) =>
      _$TopRatedResponseFromJson(json);
}

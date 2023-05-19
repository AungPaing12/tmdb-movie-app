import 'package:json_annotation/json_annotation.dart';
part 'popular_movie_result_vo.g.dart';
@JsonSerializable()
class PopularMovieResultsVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'releaseDate')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'video')
  bool? video;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  PopularMovieResultsVO({this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount});

  factory PopularMovieResultsVO.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResultsVOFromJson(json);

}
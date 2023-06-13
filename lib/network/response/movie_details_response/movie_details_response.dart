import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constant/hive_constant.dart';
import '../../../data/vos/genres_vo/genres_vo.dart';
import '../../../data/vos/production_companies_vo/production_companies_vo.dart';
import '../../../data/vos/production_countries_vo/production_countries_vo.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'movie_details_response.g.dart';

@HiveType(typeId: kMovieDetailTypeID)
@JsonSerializable()
class MovieDetailsResponse {
  @HiveField(1)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(2)
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @HiveField(3)
  @JsonKey(name: 'budget')
  int? budget;

  @HiveField(4)
  @JsonKey(name: 'genres')
  List<GenresVO>? genres;

  @HiveField(5)
  @JsonKey(name: 'homepage')
  String? homepage;

  @HiveField(6)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(7)
  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @HiveField(8)
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @HiveField(9)
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @HiveField(10)
  @JsonKey(name: 'overview')
  String? overview;

  @HiveField(11)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(12)
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @HiveField(13)
  @JsonKey(name: 'production_companies')
  List<ProductionCompaniesVO>? productionCompanies;

  @HiveField(14)
  @JsonKey(name: 'production_countries')
  List<ProductionCountriesVO>? productionCountries;

  @HiveField(15)
  @JsonKey(name: 'release_date')
  String? releaseDate;

  @HiveField(16)
  @JsonKey(name: 'revenue')
  int? revenue;

  @HiveField(17)
  @JsonKey(name: 'runtime')
  int? runtime;

  @HiveField(18)
  @JsonKey(name: 'status')
  String? status;

  @HiveField(19)
  @JsonKey(name: 'tagline')
  String? tagline;

  @HiveField(20)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(21)
  @JsonKey(name: 'video')
  bool? video;

  @HiveField(22)
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @HiveField(23)
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieDetailsResponse(
      this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
}

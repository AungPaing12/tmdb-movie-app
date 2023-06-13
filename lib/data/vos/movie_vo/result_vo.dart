import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../constant/hive_constant.dart';

part 'result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kMovieVOTypeID)
class MovieVO {
  @HiveField(0)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(1)
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @HiveField(2)
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @HiveField(3)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(4)
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @HiveField(5)
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @HiveField(6)
  @JsonKey(name: 'overview')
  String? overview;

  @HiveField(7)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(8)
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @HiveField(9)
  @JsonKey(name: 'release_date')
  String? releaseDate;

  @HiveField(10)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(11)
  @JsonKey(name: 'video')
  bool? video;

  @HiveField(12)
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @HiveField(13)
  @JsonKey(name: 'vote_count')
  int? voteCount;

  @HiveField(14)
  bool? isGetNowPlaying;

  @HiveField(15)
  bool? isPopularMovie;

  @HiveField(16)
  bool? isTopRated;

  MovieVO(
      this.adult,
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
      this.voteCount,
      {this.isGetNowPlaying = false,
      this.isPopularMovie = false,
      this.isTopRated = false});

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, isGetNowPlaying: $isGetNowPlaying, isPopularMovie: $isPopularMovie, isTopRated: $isTopRated}';
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'known_for_vo.g.dart';

@JsonSerializable()
class KnownForVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'media_type')
  String? mediaType;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'video')
  bool? video;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  @JsonKey(name: 'first_air_date')
  String? firstAirDate;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  @JsonKey(name: 'original_name')
  String? originalName;

  KnownForVO(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName});

  factory KnownForVO.fromJson(Map<String, dynamic> json) =>
      _$KnownForVOFromJson(json);
}

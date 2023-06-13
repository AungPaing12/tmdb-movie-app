import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constant/hive_constant.dart';

part 'known_for_vo.g.dart';

@HiveType(typeId: kKnownForVOTypeID)
@JsonSerializable()
class KnownForVO {
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
  @JsonKey(name: 'media_type')
  String? mediaType;

  @HiveField(5)
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @HiveField(6)
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @HiveField(7)
  @JsonKey(name: 'overview')
  String? overview;

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
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;

  @HiveField(15)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(16)
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  @HiveField(17)
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

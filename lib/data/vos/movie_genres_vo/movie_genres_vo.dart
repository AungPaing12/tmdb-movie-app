import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constant/hive_constant.dart';

part 'movie_genres_vo.g.dart';

@HiveType(typeId: kMovieGenreVOTypeID)
@JsonSerializable()
class MovieGenresVO {
  @HiveField(0)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(1)
  @JsonKey(name: 'name')
  String? name;

  bool isSelect;

  MovieGenresVO({this.id, this.name, this.isSelect = false});

  factory MovieGenresVO.fromJson(Map<String, dynamic> json) =>
      _$MovieGenresVOFromJson(json);
}

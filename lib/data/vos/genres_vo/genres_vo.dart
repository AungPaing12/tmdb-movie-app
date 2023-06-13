import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constant/hive_constant.dart';

part 'genres_vo.g.dart';
@HiveType(typeId: kGenreVOTypeID)
@JsonSerializable()
class GenresVO {
  @HiveField(1)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(2)
  @JsonKey(name: 'name')
  String? name;

  GenresVO(this.id, this.name);

  factory GenresVO.fromJson(Map<String, dynamic> json) =>
      _$GenresVOFromJson(json);
}
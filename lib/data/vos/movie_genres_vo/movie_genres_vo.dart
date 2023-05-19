import 'package:json_annotation/json_annotation.dart';

part 'movie_genres_vo.g.dart';

@JsonSerializable()
class MovieGenresVO {

  @JsonKey(name: 'id')
  int? id;


  @JsonKey(name: 'name')
  String? name;

  MovieGenresVO(this.id, this.name);


  factory MovieGenresVO.fromJson(Map<String, dynamic> json) =>
      _$MovieGenresVOFromJson(json);
}
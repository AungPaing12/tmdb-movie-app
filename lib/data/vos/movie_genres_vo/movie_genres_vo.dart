import 'package:json_annotation/json_annotation.dart';

part 'movie_genres_vo.g.dart';

@JsonSerializable()
class MovieGenresVO {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  bool isSelect;
  MovieGenresVO({this.id, this.name,this.isSelect = false});


  factory MovieGenresVO.fromJson(Map<String, dynamic> json) =>
      _$MovieGenresVOFromJson(json);
}
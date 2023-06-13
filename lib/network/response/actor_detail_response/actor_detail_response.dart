import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constant/hive_constant.dart';

part 'actor_detail_response.g.dart';

@HiveType(typeId: kActorDetailTypeID)
@JsonSerializable()
class ActorDetailResponseVO {
  @HiveField(0)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(1)
  @JsonKey(name: 'also_known_as')
  List<String>? alsoKnownAs;

  @HiveField(2)
  @JsonKey(name: 'biography')
  String? biography;

  @HiveField(3)
  @JsonKey(name: 'birthday')
  String? birthday;

  @HiveField(4)
  @JsonKey(name: 'deathday')
  String? deathday;

  @HiveField(5)
  @JsonKey(name: 'gender')
  int? gender;

  @HiveField(6)
  @JsonKey(name: 'homepage')
  String? homepage;

  @HiveField(7)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(8)
  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @HiveField(9)
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @HiveField(10)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(11)
  @JsonKey(name: 'place_of_birth')
  String? placeOfBirth;

  @HiveField(12)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(13)
  @JsonKey(name: 'profile_path')
  String? profilePath;

  ActorDetailResponseVO(
      {this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.deathday,
      this.gender,
      this.homepage,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath});

  factory ActorDetailResponseVO.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailResponseVOFromJson(json);

  @override
  String toString() {
    return 'ActorDetailResponseVO{adult: $adult, alsoKnownAs: $alsoKnownAs, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdbId: $imdbId, knownForDepartment: $knownForDepartment, name: $name, placeOfBirth: $placeOfBirth, popularity: $popularity, profilePath: $profilePath}';
  }
}

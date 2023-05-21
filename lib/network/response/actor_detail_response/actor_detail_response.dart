import 'package:json_annotation/json_annotation.dart';

part 'actor_detail_response.g.dart';
@JsonSerializable()
class ActorDetailResponseVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'also_known_as')
  List<String>? alsoKnownAs;

  @JsonKey(name: 'biography')
  String? biography;

  @JsonKey(name: 'birthday')
  String? birthday;

  @JsonKey(name: 'deathday')
  String? deathday;

  @JsonKey(name: 'gender')
  int? gender;

  @JsonKey(name: 'homepage')
  String? homepage;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'place_of_birth')
  String? placeOfBirth;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'profile_path')
  String? profilePath;

  ActorDetailResponseVO({this.adult,
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

  factory ActorDetailResponseVO.fromJson(Map<String,dynamic>json) => _$ActorDetailResponseVOFromJson(json);

  @override
  String toString() {
    return 'ActorDetailResponseVO{adult: $adult, alsoKnownAs: $alsoKnownAs, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdbId: $imdbId, knownForDepartment: $knownForDepartment, name: $name, placeOfBirth: $placeOfBirth, popularity: $popularity, profilePath: $profilePath}';
  }
}
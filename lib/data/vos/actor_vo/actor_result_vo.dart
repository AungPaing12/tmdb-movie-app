import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constant/hive_constant.dart';
import '../known_for_vo/known_for_vo.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'actor_result_vo.g.dart';

@HiveType(typeId: kActorVOTypeID)
@JsonSerializable()
class ActorResultsVO {
  @HiveField(0)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(1)
  @JsonKey(name: 'gender')
  int? gender;

  @HiveField(2)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(3)
  @JsonKey(name: 'known_for')
  List<KnownForVO>? knownFor;

  @HiveField(4)
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @HiveField(5)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(6)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(7)
  @JsonKey(name: 'profile_path')
  String? profilePath;

  ActorResultsVO(
      {this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath});

  factory ActorResultsVO.fromJson(Map<String, dynamic> json) =>
      _$ActorResultsVOFromJson(json);

  @override
  String toString() {
    return 'ActorResultsVO{adult: $adult, gender: $gender, id: $id, knownFor: $knownFor, knownForDepartment: $knownForDepartment, name: $name, popularity: $popularity, profilePath: $profilePath}';
  }
}

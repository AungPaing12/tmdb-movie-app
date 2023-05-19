
import 'package:json_annotation/json_annotation.dart';

import '../known_for_vo/known_for_vo.dart';
part 'actor_result_vo.g.dart';
@JsonSerializable()
class ActorResultsVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'gender')
  int? gender;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'known_for')
  List<KnownForVO>? knownFor;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'popularity')
  double? popularity;

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

  factory ActorResultsVO.fromJson(Map<String,dynamic>json) => _$ActorResultsVOFromJson(json);
}
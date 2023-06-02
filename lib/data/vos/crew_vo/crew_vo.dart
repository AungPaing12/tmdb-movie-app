import 'package:json_annotation/json_annotation.dart';
part 'crew_vo.g.dart';
@JsonSerializable()
class CrewVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'gender')
  int? gender;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'profile_path')
  String? profilePath;

  @JsonKey(name: 'credit_id')
  String? creditId;

  @JsonKey(name: 'department')
  String? department;

  @JsonKey(name: 'job')
  String? job;

  CrewVO(
      {this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.creditId,
        this.department,
        this.job});

  factory CrewVO.fromJson(Map<String, dynamic> json) => _$CrewVOFromJson(json);

  @override
  String toString() {
    return 'CrewVO{adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, creditId: $creditId, department: $department, job: $job}';
  }
}
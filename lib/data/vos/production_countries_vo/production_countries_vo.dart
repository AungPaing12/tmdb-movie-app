import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constant/hive_constant.dart';

part 'production_countries_vo.g.dart';
@HiveType(typeId: kProductionCountryVOTypeID)
@JsonSerializable()
class ProductionCountriesVO {
  @HiveField(0)
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;

  @HiveField(1)
  @JsonKey(name: 'name')
  String? name;

  ProductionCountriesVO(this.iso31661, this.name);

  factory ProductionCountriesVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesVOFromJson(json);
}
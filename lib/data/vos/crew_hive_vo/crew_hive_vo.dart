import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import '../../../constant/hive_constant.dart';
part 'crew_hive_vo.g.dart';
@HiveType(typeId: kCrewHiveTypeID)

class CrewHiveVO {

  @HiveField(0)
  List<CrewVO>? crewList;


  CrewHiveVO(this.crewList);
}
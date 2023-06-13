import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app/persistent/crew_dao/crew_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrewDaoImpl extends CrewDao {
  CrewDaoImpl._();

  static final CrewDaoImpl _singleton = CrewDaoImpl._();

  factory CrewDaoImpl() => _singleton;

  @override
  List<CrewVO>? getCrewListFromDataBase(int movieID) => _crewBox().values.toList();

  @override
  Stream<List<CrewVO>?> getCrewListFromDataBaseStream(int movieID) =>
      Stream.value(getCrewListFromDataBase(movieID));

  Box<CrewVO> _crewBox() => Hive.box<CrewVO>(kBoxNameForCrewVO);

  @override
  save(List<CrewVO> crewList) {
   for(CrewVO crewVO in crewList){
     _crewBox().put(crewVO.id, crewVO);
   }
  }

  @override
  Stream watchCrewBox() => _crewBox().watch();
}

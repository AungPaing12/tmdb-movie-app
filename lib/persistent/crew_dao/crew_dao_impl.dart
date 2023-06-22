import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app/persistent/crew_dao/crew_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/vos/crew_hive_vo/crew_hive_vo.dart';

class CrewDaoImpl extends CrewDao {
  CrewDaoImpl._();

  static final CrewDaoImpl _singleton = CrewDaoImpl._();

  factory CrewDaoImpl() => _singleton;

  @override
  CrewHiveVO? getCrewListFromDataBase(int movieID) => _crewBox().get(movieID);

  @override
  Stream<CrewHiveVO?> getCrewListFromDataBaseStream(int movieID) =>
      Stream.value(getCrewListFromDataBase(movieID));

  Box<CrewHiveVO> _crewBox() => Hive.box<CrewHiveVO>(kBoxNameForCrewHiveVO);

  @override
  save(CrewHiveVO crewList,int movieID) {
    _crewBox().put(movieID, crewList);
  }

  @override
  Stream watchCrewBox() => _crewBox().watch();
}

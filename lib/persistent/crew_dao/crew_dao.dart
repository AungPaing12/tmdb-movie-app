import 'package:movie_app/data/vos/crew_hive_vo/crew_hive_vo.dart';

abstract class CrewDao {
  void save(CrewHiveVO crewList, int movieID);

  CrewHiveVO? getCrewListFromDataBase(int movieID);

  Stream<CrewHiveVO?> getCrewListFromDataBaseStream(int movieID);

  Stream  watchCrewBox();

}

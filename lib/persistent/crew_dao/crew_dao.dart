import '../../data/vos/crew_vo/crew_vo.dart';

abstract class CrewDao {
  void save(List<CrewVO> crewList);

  List<CrewVO>? getCrewListFromDataBase(int movieID);

  Stream<List<CrewVO>?> getCrewListFromDataBaseStream(int movieID);

  Stream  watchCrewBox();

}

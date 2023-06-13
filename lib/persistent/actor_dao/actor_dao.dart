import '../../data/vos/actor_vo/actor_result_vo.dart';
abstract class ActorDao {
  void save(List<ActorResultsVO> actorList);

  List<ActorResultsVO>? getActorListFromDataBase();

  Stream<List<ActorResultsVO>?> getActorListFromDataBaseStream();

  Stream  watchActorBox();

}

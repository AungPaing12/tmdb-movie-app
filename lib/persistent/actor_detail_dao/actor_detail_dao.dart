import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

abstract class ActorDetailDao {
  void save(ActorDetailResponseVO? actorDetailList);

  ActorDetailResponseVO? getActorDetailListFromDataBase(int actorID);

  Stream<ActorDetailResponseVO?> getActorDetailListFromDataBaseStream(int actorID);

  Stream  watchActorDetailBox();

}

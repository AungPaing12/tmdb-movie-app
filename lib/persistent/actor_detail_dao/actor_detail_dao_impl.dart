import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

import 'actor_detail_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ActorDetailDaoImpl extends ActorDetailDao {
  ActorDetailDaoImpl._();

  static final ActorDetailDaoImpl _singleton = ActorDetailDaoImpl._();

  factory ActorDetailDaoImpl() => _singleton;

  @override
  ActorDetailResponseVO? getActorDetailListFromDataBase(int actorID) =>
      _actorDetailBox().get(actorID);

  @override
  Stream<ActorDetailResponseVO?> getActorDetailListFromDataBaseStream(int actorID) =>
      Stream.value(getActorDetailListFromDataBase(actorID));

  Box<ActorDetailResponseVO> _actorDetailBox() =>
      Hive.box<ActorDetailResponseVO>(kBoxNameForActorDetailVO);

  @override
  save(ActorDetailResponseVO? actorDetailList) {
    _actorDetailBox().put(actorDetailList?.id, actorDetailList!);
  }

  @override
  Stream watchActorDetailBox() => _actorDetailBox().watch();
}

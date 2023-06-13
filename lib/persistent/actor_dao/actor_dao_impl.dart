import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/data/vos/actor_vo/actor_result_vo.dart';
import 'package:movie_app/persistent/actor_dao/actor_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ActorDaoImpl extends ActorDao {
  ActorDaoImpl._();

  static final ActorDaoImpl _singleton = ActorDaoImpl._();

  factory ActorDaoImpl() => _singleton;

  @override
  List<ActorResultsVO> getActorListFromDataBase() =>
      _actorBox().values.toList();

  @override
  Stream<List<ActorResultsVO>?> getActorListFromDataBaseStream() =>
      Stream.value(getActorListFromDataBase());

  @override
  save(List<ActorResultsVO> actorList) {
    for (ActorResultsVO actorResultsVO in actorList) {
      _actorBox().put(actorResultsVO.id, actorResultsVO);
    }
  }

  Box<ActorResultsVO> _actorBox() =>
      Hive.box<ActorResultsVO>(kBoxNameForActorVO);

  @override
  Stream watchActorBox() => _actorBox().watch();
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/data/vos/cast_vo/cast_vo.dart';

import 'cast_dao.dart';

class CastDaoImpl extends CastDao {
  CastDaoImpl._();

  static final CastDaoImpl _singleton = CastDaoImpl._();

  factory CastDaoImpl() => _singleton;

  @override
  List<CastVO>? getCastListFromDataBase(int movieID) => _castBox().values.toList();

  @override
  Stream<List<CastVO>?> getCastListFromDataBaseStream(int movieID) =>
      Stream.value(getCastListFromDataBase(movieID));

  Box<CastVO> _castBox() => Hive.box<CastVO>(kBoxNameForCastVO);

  @override
  save(List<CastVO> castList) {
    for (CastVO castVO in castList) {
      _castBox().put(castVO.id, castVO);
    }
  }

  @override
  Stream watchCastBox() => _castBox().watch();
}

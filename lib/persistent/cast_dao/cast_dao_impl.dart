import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constant/hive_constant.dart';
import '../../data/vos/cast_hive_vo/cast_hive_vo.dart';
import 'cast_dao.dart';

class CastDaoImpl extends CastDao {
  CastDaoImpl._();

  static final CastDaoImpl _singleton = CastDaoImpl._();

  factory CastDaoImpl() => _singleton;

  @override
  CastHiveVO? getCastListFromDataBase(int movieID) => _castBox().get(movieID);

  @override
  Stream<CastHiveVO?> getCastListFromDataBaseStream(int movieID) =>
      Stream.value(getCastListFromDataBase(movieID));

  Box<CastHiveVO> _castBox() => Hive.box<CastHiveVO>(kBoxNameForCastHiveVO);



  @override
  Stream watchCastBox() => _castBox().watch();

  @override
  void save(CastHiveVO castList, id) {
  _castBox().put(id, castList);
  }


}

import 'package:movie_app/data/vos/cast_hive_vo/cast_hive_vo.dart';

abstract class CastDao {
  void save(CastHiveVO castList, int id);

  CastHiveVO? getCastListFromDataBase(int movieID);

  Stream<CastHiveVO?> getCastListFromDataBaseStream(int movieID);

  Stream  watchCastBox();

}

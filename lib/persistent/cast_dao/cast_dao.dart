import 'package:movie_app/data/vos/cast_vo/cast_vo.dart';

abstract class CastDao {
  void save(List<CastVO> castList);

  List<CastVO>? getCastListFromDataBase(int movieID);

  Stream<List<CastVO>?> getCastListFromDataBaseStream(int movieID);

  Stream  watchCastBox();

}

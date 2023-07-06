
import '../../data/vos/movie_vo/result_vo.dart';
abstract class MovieDAO {
  void save(List<MovieVO>? movies);

  List<MovieVO>? getNowPlayingListFromDataBase();

  List<MovieVO>? getTopRatedListFromDataBase();

  List<MovieVO>? getPopularListFromDataBase();

  Stream<List<MovieVO>?> getNowPlayingListFromDataBaseStream();

  Stream<List<MovieVO>?> getTopRatedListFromDataBaseStream();

  Stream<List<MovieVO>?> getPopularListFromDataBaseStream();

  Stream watchMovieBox();

}

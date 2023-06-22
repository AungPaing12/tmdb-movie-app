import '../../data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';

abstract class  RecommenedMovieDao{
  void save(MovieHiveVO movieList, int movieID);

  MovieHiveVO? getCrewListFromDataBase(int movieID);

  Stream<MovieHiveVO?> getCrewListFromDataBaseStream(int movieID);

  Stream  watchMovieBox();

}

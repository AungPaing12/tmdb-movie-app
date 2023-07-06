import '../../data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';

abstract class RecommenedMovieDao {
  void save(MovieHiveVO movieList, int movieID);

  MovieHiveVO? getRecommenedMovieListFromDataBase(int movieID);

  MovieHiveVO? getMovieByGenresListFromDataBase(int genreID);

  Stream<MovieHiveVO?> getRecommenedMovieFromDataBaseStream(int movieID);

  Stream<MovieHiveVO?> getMovieByGenresListFromDataBaseStream(int genreID);

  Stream watchMovieBox();
}

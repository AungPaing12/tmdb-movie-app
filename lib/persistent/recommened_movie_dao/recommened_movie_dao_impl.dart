import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';
import 'package:movie_app/persistent/recommened_movie_dao/recommended_movie_dao.dart';
import '../../constant/hive_constant.dart';

class RecommenedMovieDaoImpl extends RecommenedMovieDao {
  RecommenedMovieDaoImpl._();

  static final RecommenedMovieDaoImpl _singleton = RecommenedMovieDaoImpl._();

  factory RecommenedMovieDaoImpl() => _singleton;

  Box<MovieHiveVO> _movieBox() => Hive.box<MovieHiveVO>(kBoxNameForMovieHiveVO);

  @override
  Stream watchMovieBox() => _movieBox().watch();

  @override
  MovieHiveVO? getRecommenedMovieListFromDataBase(int movieID) =>
      _movieBox().get(movieID);

  @override
  Stream<MovieHiveVO?> getRecommenedMovieFromDataBaseStream(int movieID) =>
      Stream.value(getRecommenedMovieListFromDataBase(movieID));

  @override
  void save(MovieHiveVO movieList, int movieID) {
    _movieBox().put(movieID, movieList);
  }

  @override
  MovieHiveVO? getMovieByGenresListFromDataBase(int genreID) =>
      _movieBox().get(genreID);

  @override
  Stream<MovieHiveVO?> getMovieByGenresListFromDataBaseStream(int genreID) =>
      Stream.value(getMovieByGenresListFromDataBase(genreID));
}

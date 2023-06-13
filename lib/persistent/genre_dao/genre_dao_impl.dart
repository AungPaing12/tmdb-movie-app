import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/data/vos/movie_genres_vo/movie_genres_vo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'genre_dao.dart';

class MovieGenreDAOImpl extends MovieGenreDAO{

  MovieGenreDAOImpl._();

  static final MovieGenreDAOImpl _singleton = MovieGenreDAOImpl._();

  factory MovieGenreDAOImpl() => _singleton;
  @override
  List<MovieGenresVO>? getGenreListFromDataBase() => _movieGenreBox().values.toList();

  @override
  Stream<List<MovieGenresVO>?> getGenreListFromDataBaseStream() => Stream.value(getGenreListFromDataBase());

  Box<MovieGenresVO> _movieGenreBox() => Hive.box<MovieGenresVO>(kBoxNameForMovieGenreVO);

  @override
  void saveGenreList(List<MovieGenresVO>? genreList) {
   for(MovieGenresVO movieGenresVO in genreList!){
     _movieGenreBox().put(movieGenresVO.id, movieGenresVO);
   }
  }

  @override
  Stream watchGenreBox() => _movieGenreBox().watch();

}
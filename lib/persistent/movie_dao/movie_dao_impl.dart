import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constant/hive_constant.dart';

import 'package:movie_app/data/vos/movie_vo/result_vo.dart';

import 'movie_dao.dart';

class MovieDAOImpl extends MovieDAO {
  MovieDAOImpl._();

  static final MovieDAOImpl _singleton = MovieDAOImpl._();

  factory MovieDAOImpl() => _singleton;

  @override
  List<MovieVO>? getNowPlayingListFromDataBase() {
    final getMovies = _movieBox().values.toList();
    return getMovies
        .where((element) => element.isGetNowPlaying ?? false)
        .toList();
  }

  @override
  Stream<List<MovieVO>?> getNowPlayingListFromDataBaseStream() =>
      Stream.value(getNowPlayingListFromDataBase());

  @override
  List<MovieVO>? getPopularListFromDataBase() {
    final getPopularMovies = _movieBox().values.toList();
    return getPopularMovies
        .where((element) => element.isPopularMovie ?? false)
        .toList();
  }

  @override
  Stream<List<MovieVO>?> getPopularListFromDataBaseStream() =>
      Stream.value(getPopularListFromDataBase());

  @override
  List<MovieVO>? getTopRatedListFromDataBase() {
    final getTopRatedMovies = _movieBox().values.toList();
    return getTopRatedMovies
        .where((element) => element.isTopRated ?? false)
        .toList();
  }

  @override
  Stream<List<MovieVO>?> getTopRatedListFromDataBaseStream() =>
      Stream.value(getTopRatedListFromDataBase());

  @override
  List<MovieVO>? getSimilarMovieListFromDataBase() =>
      _movieBox().values.toList();

  @override
  Stream<List<MovieVO>?> getSimilarMovieListFromDataBaseStream() =>
      Stream.value(getSimilarMovieListFromDataBase());

  Box<MovieVO> _movieBox() => Hive.box<MovieVO>(kBoxNameForMovieVO);

  @override
  void save(List<MovieVO>? movies) {
    for (MovieVO movieVO in movies!) {
      _movieBox().put(movieVO.id, movieVO);
    }
  }

  @override
  Stream watchMovieBox() => _movieBox().watch();
}

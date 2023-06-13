import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/network/response/movie_details_response/movie_details_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'movie_detail_dao.dart';

class MovieDetailDaoImpl extends MovieDetailDao {
  MovieDetailDaoImpl._();

  static final MovieDetailDaoImpl _singleton = MovieDetailDaoImpl._();

  factory MovieDetailDaoImpl() => _singleton;

  @override
  MovieDetailsResponse? getMovieDetailListFromDataBase(int movieID) =>
      _movieDetailBox().get(movieID);

  @override
  Stream<MovieDetailsResponse?> getMovieDetailListFromDataBaseStream(int movieID) =>
      Stream.value(getMovieDetailListFromDataBase(movieID));

  Box<MovieDetailsResponse> _movieDetailBox() =>
      Hive.box<MovieDetailsResponse>(kBoxNameForMovieDetailVO);

  @override
  save(MovieDetailsResponse? movieDetailList) {
    _movieDetailBox().put(movieDetailList?.id, movieDetailList!);
  }

  @override
  Stream watchActorDetailBox() => _movieDetailBox().watch();
}

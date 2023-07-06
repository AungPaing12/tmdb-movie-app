import 'package:movie_app/data/vos/cast_hive_vo/cast_hive_vo.dart';
import 'package:movie_app/data/vos/crew_hive_vo/crew_hive_vo.dart';
import 'package:movie_app/data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

import '../../../network/response/movie_details_response/movie_details_response.dart';
import '../../vos/actor_vo/actor_result_vo.dart';
import '../../vos/cast_vo/cast_vo.dart';
import '../../vos/crew_vo/crew_vo.dart';
import '../../vos/movie_genres_vo/movie_genres_vo.dart';
import '../../vos/movie_vo/result_vo.dart';


abstract class MovieModel {
  Future<List<MovieVO>?> getMovieByGenresList(int genresID,int page);

  Stream<MovieHiveVO?> getMovieByGenresListFromDataBase(int genreID);

  Future<List<ActorResultsVO>?> getActorList();

  Stream<List<ActorResultsVO>?> getActorListFromDatabase();

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Stream<MovieDetailsResponse?> getMovieDetailsFromDatabase(int movieID);

  Future<ActorDetailResponseVO?> getActorDetails(int actorID);

  Stream<ActorDetailResponseVO?> getActorDetailsFromDatabase(int actorID);

  Future<List<MovieGenresVO>?> getMovieGenreList();

  Stream<List<MovieGenresVO>?> getMovieGenreListFromDataBase();

  Future<List<MovieVO>?> getPopularMovieList(int page);

  Stream<List<MovieVO>?> getPopularMovieListFromDataBase();

  Future<List<MovieVO>?> getTopRatedMovieList(int page);

  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBase();

  Future<List<CastVO>?> getCast(int movieID);

  Stream<CastHiveVO?> getCastListFromDataBase(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Stream<CrewHiveVO?> getCrewListFromDataBase(int movieID);

  Future<List<MovieVO>?> getSimilarMovieList(int movieID);

  Stream<MovieHiveVO?> getSimilarMovieListFromDataBase(int movieID);

  Future<List<MovieVO>?> getSearchMovie(String movieName);
}

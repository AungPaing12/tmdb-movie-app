import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

import '../../../network/response/movie_details_response/movie_details_response.dart';
import '../../vos/actor_vo/actor_result_vo.dart';
import '../../vos/cast_vo/cast_vo.dart';
import '../../vos/crew_vo/crew_vo.dart';
import '../../vos/genres_vo/genres_vo.dart';
import '../../vos/movie_genres_vo/movie_genres_vo.dart';
import '../../vos/movie_vo/result_vo.dart';
import '../../vos/production_companies_vo/production_companies_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>?> getNowPlayingList();

  Stream<List<MovieVO>?> getNowPlayingListFromDataBase();

  Future<List<ActorResultsVO>?> getActorList();

  Stream<List<ActorResultsVO>?> getActorListFromDatabase();

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Stream<MovieDetailsResponse?> getMovieDetailsFromDatabase(int movieID);

  Future<ActorDetailResponseVO?> getActorDetails(int actorID);

  Stream<ActorDetailResponseVO?> getActorDetailsFromDatabase(int actorID);

  Future<List<MovieGenresVO>?> getMovieGenreList();

  Stream<List<MovieGenresVO>?> getMovieGenreListFromDataBase();

  Future<List<MovieVO>?> getPopularMovieList();

  Stream<List<MovieVO>?> getPopularMovieListFromDataBase();

  Future<List<MovieVO>?> getTopRatedMovieList();

  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBase();

  Future<List<CastVO>?> getCast(int movieID);

  Stream<List<CastVO>?> getCastListFromDataBase(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Stream<List<CrewVO>?> getCrewListFromDataBase(int movieID);

  Future<List<MovieVO>?> getSimilarMovieList(int movieID);

  Stream<List<MovieVO>?> getSimilarMovieListFromDataBase(int movieID);



  Future<List<MovieVO>?> getSearchMovie(String movieName);
}

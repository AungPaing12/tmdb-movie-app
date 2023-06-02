
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

import '../../../network/response/movie_details_response/movie_details_response.dart';
import '../../vos/actor_vo/actor_result_vo.dart';
import '../../vos/cast_vo/cast_vo.dart';
import '../../vos/crew_vo/crew_vo.dart';
import '../../vos/genres_vo/genres_vo.dart';
import '../../vos/movie_genres_vo/movie_genres_vo.dart';
import '../../vos/movie_vo/result_vo.dart';
import '../../vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../../vos/production_companies_vo/production_companies_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>?> getMoviesList();

  Future<List<ActorResultsVO>?> getActorList();

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Future<ActorDetailResponseVO?> getActorDetails(int movieID);

  Future<List<MovieGenresVO>?> getMovieGenreList();

  Future<List<PopularMovieResultsVO>?> getPopularMovieList();

  Future<List<MovieVO>?> getTopRatedMovieList();

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<List<PopularMovieResultsVO>?> getSimilarMovieList(int movieID);

  Future<List<ProductionCompaniesVO>?> getProductionCompanyList(int movieID);

  Future<List<GenresVO>?> getGenre(int movieID);

}
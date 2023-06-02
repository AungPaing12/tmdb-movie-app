import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

import '../../../data/vos/actor_vo/actor_result_vo.dart';
import '../../../data/vos/cast_vo/cast_vo.dart';
import '../../../data/vos/crew_vo/crew_vo.dart';
import '../../../data/vos/genres_vo/genres_vo.dart';
import '../../../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../../../data/vos/movie_vo/result_vo.dart';
import '../../../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../../../data/vos/production_companies_vo/production_companies_vo.dart';
import '../../response/movie_details_response/movie_details_response.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getMoviesList();

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Future<ActorDetailResponseVO?> getActorDetails(int movieID);

  Future<List<ActorResultsVO>?> getActorList();

  Future<List<MovieGenresVO>?> getMovieGenresList();

  Future<List<PopularMovieResultsVO>?> getPopularMovieList();

  Future<List<MovieVO>?>  getTopRatedMovie();

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<List<PopularMovieResultsVO>?> getSimilarMovieList(int movieID);

  Future<List<ProductionCompaniesVO>?> getProductionCompanyVO(int movieID);

  Future<List<GenresVO>?> getGenre(int movieID);

}
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

import '../../../data/vos/actor_vo/actor_result_vo.dart';
import '../../../data/vos/cast_vo/cast_vo.dart';
import '../../../data/vos/crew_vo/crew_vo.dart';
import '../../../data/vos/genres_vo/genres_vo.dart';
import '../../../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../../../data/vos/movie_vo/result_vo.dart';
import '../../../data/vos/production_companies_vo/production_companies_vo.dart';
import '../../response/movie_details_response/movie_details_response.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getMoviesByGenresList(int genresID,int page);

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Future<ActorDetailResponseVO?> getActorDetails(int movieID);

  Future<List<ActorResultsVO>?> getActorList();

  Future<List<MovieGenresVO>?> getMovieGenresList();

  Future<List<MovieVO>?> getPopularMovieList(int page);

  Future<List<MovieVO>?>  getTopRatedMovie(int page);

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<List<MovieVO>?> getSimilarMovieList(int movieID);

  Future<List<ProductionCompaniesVO>?> getProductionCompanyList(int movieID);

  Future<List<GenresVO>?> getGenre(int movieID);

  Future<List<MovieVO>?> getSearchMovieList(String movieName);

}

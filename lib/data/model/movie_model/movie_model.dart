
import '../../../network/response/movie_details_response/movie_details_response.dart';
import '../../vos/actor_vo/actor_result_vo.dart';
import '../../vos/movie_genres_vo/movie_genres_vo.dart';
import '../../vos/movie_vo/result_vo.dart';
import '../../vos/popular_movies_result_vo/popular_movie_result_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>?> getMoviesList();

  Future<List<ActorResultsVO>?> getActorList();

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Future<List<MovieGenresVO>?> getMovieGenreList();

  Future<List<PopularMovieResultsVO>?> getPopularMovieList();

  Future<List<MovieVO>?> getTopRatedMovieList();
}
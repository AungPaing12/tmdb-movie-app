import '../../../data/vos/actor_vo/actor_result_vo.dart';
import '../../../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../../../data/vos/movie_vo/result_vo.dart';
import '../../../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../../response/movie_details_response/movie_details_response.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getMoviesList();

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

  Future<List<ActorResultsVO>?> getActorList();

  Future<List<MovieGenresVO>?> getMovieGenresList();

  Future<List<PopularMovieResultsVO>?> getPopularMovieList();

  Future<List<MovieVO>?>  getTopRatedMovie();

  
}
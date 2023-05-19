import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../constant/api_constant.dart';
import '../../response/actor_response/actor_response.dart';
import '../../response/movie_details_response/movie_details_response.dart';
import '../../response/movie_genres_response/movie_genres_response.dart';
import '../../response/movie_response/movie_response.dart';
import '../../response/popular_movie_response/popular_movie_response.dart';
import '../../response/top_rated_response/top_rated_response.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kMovieBaseURL)
abstract class MovieAPI {
  factory MovieAPI(Dio dio) => _MovieAPI(dio);

  @GET(kGetNowPlayingMoviesEndPoint)
  Future<MovieResponse> getNowPlayingMovieResponse(
      @Query(kQueryParamsApiKey) String apiKey,
      );

  @GET(kGetMovieDetailsEndPoint)
  Future<MovieDetailsResponse> getMovieDetailsResponse(
      @Query(kQueryParamsApiKey) String apiKey,
      @Path(kPathParameterMovieID) int movieID);

  @GET(kGetActorEndPoint)
  Future<ActorResponse> getActorList(
      @Query(kQueryParamsApiKey) String apiKey,
      );

  @GET(kGenresEndPoint)
  Future<MovieGenresResponse> getMovieGenresResponse(
      @Query(kQueryParamsApiKey) String apiKey,
      );

  @GET(kGetPopularMovieEndPoint)
  Future<PopularMovieResponse> getPopularMovie(
      @Query(kQueryParamsApiKey) String apiKey,
      );

  @GET(kGetTopRatedEndPoint)
  Future<TopRatedResponse> getTopRated(
      @Query(kQueryParamsApiKey) String apiKey,
      );

}

import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/cast_vo/cast_vo.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app/data/vos/movie_genres_vo/movie_genres_vo.dart';
import 'package:movie_app/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';
import '../../../constant/api_constant.dart';
import '../../../data/vos/actor_vo/actor_result_vo.dart';
import '../../../data/vos/movie_vo/result_vo.dart';
import '../../api/movie_api/movie_api.dart';
import '../../response/movie_details_response/movie_details_response.dart';
import 'movie_data_agent.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late MovieAPI _api;

  MovieDataAgentImpl._() {
    _api = MovieAPI(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieID) =>
      _api.getMovieDetailsResponse(kApiKey, movieID);

  @override
  Future<ActorDetailResponseVO?> getActorDetails(int movieID) =>
      _api.getActorDetailsResponse(kApiKey, movieID);

  @override
  Future<List<MovieVO>?> getMoviesList() => _api
      .getNowPlayingMovieResponse(kApiKey)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ActorResultsVO>?> getActorList() =>
      _api.getActorList(kApiKey).asStream().map((event) => event.results).first;

  @override
  Future<List<MovieGenresVO>?> getMovieGenresList() => _api
      .getMovieGenresResponse(kApiKey)
      .asStream()
      .map((event) => event.genres)
      .first;

  @override
  Future<List<MovieVO>?> getPopularMovieList() => _api
      .getPopularMovie(kApiKey)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getTopRatedMovie() =>
      _api.getTopRated(kApiKey).asStream().map((event) => event.results).first;

  @override
  Future<List<CastVO>?> getCast(int movieID) => _api
      .getCastAndCrewResponse(kApiKey, movieID)
      .asStream()
      .map((event) => event.cast)
      .first;

  @override
  Future<List<CrewVO>?> getCrew(int movieID) => _api
      .getCastAndCrewResponse(kApiKey, movieID)
      .asStream()
      .map((event) => event.crew)
      .first;

  @override
  Future<List<MovieVO>?> getSimilarMovieList(int movieID) => _api
      .getSimilarMovie(kApiKey, movieID)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ProductionCompaniesVO>?> getProductionCompanyList(int movieID) =>
      _api
          .getMovieDetailsResponse(kApiKey, movieID)
          .asStream()
          .map((event) => event.productionCompanies)
          .first;

  @override
  Future<List<GenresVO>?> getGenre(int movieID) => _api
      .getGenre(kApiKey, movieID)
      .asStream()
      .map((event) => event.genres)
      .first;

  @override
  Future<List<MovieVO>?> getSearchMovieList(String movieName) => _api
      .getSearchMovie(kApiKey, movieName)
      .asStream()
      .map((event) => event.results)
      .first;
}

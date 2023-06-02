import 'package:movie_app/data/vos/cast_vo/cast_vo.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app/data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import 'package:movie_app/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';
import '../../../network/data_agent/movie_data_agent/movie_data_agent.dart';
import '../../../network/data_agent/movie_data_agent/movie_data_agent_impl.dart';
import '../../../network/response/movie_details_response/movie_details_response.dart';
import '../../vos/actor_vo/actor_result_vo.dart';
import '../../vos/movie_genres_vo/movie_genres_vo.dart';
import '../../vos/movie_vo/result_vo.dart';
import 'movie_model.dart';

class MovieModelImpl extends MovieModel {
  MovieModelImpl._();

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieID) =>
      _movieDataAgent.getMovieDetails(movieID);

  @override
  Future<ActorDetailResponseVO?> getActorDetails(int movieID) =>
      _movieDataAgent.getActorDetails(movieID).then((value) {
        final actorData = value;
        if (actorData?.deathday == null || actorData?.deathday == '') {
          actorData?.deathday = '-';
        }
        return actorData;
      });

  @override
  Future<List<MovieVO>?> getMoviesList() => _movieDataAgent.getMoviesList();

  @override
  Future<List<ActorResultsVO>?> getActorList() =>
      _movieDataAgent.getActorList();

  @override
  Future<List<MovieVO>?> getTopRatedMovieList() =>
      _movieDataAgent.getTopRatedMovie();

  @override
  Future<List<MovieGenresVO>?> getMovieGenreList() =>
      _movieDataAgent.getMovieGenresList();

  @override
  Future<List<PopularMovieResultsVO>?> getPopularMovieList() =>
      _movieDataAgent.getPopularMovieList();

  @override
  Future<List<CastVO>?> getCast(int movieID) =>
      _movieDataAgent.getCast(movieID);

  @override
  Future<List<CrewVO>?> getCrew(int movieID) =>
      _movieDataAgent.getCrew(movieID);

  @override
  Future<List<PopularMovieResultsVO>?> getSimilarMovieList(int movieID) =>
      _movieDataAgent.getSimilarMovieList(movieID);

  @override
  Future<List<ProductionCompaniesVO>?> getProductionCompanyList(int movieID) =>
      _movieDataAgent.getProductionCompanyVO(movieID);

  @override
  Future<List<GenresVO>?> getGenre(int movieID) =>
      _movieDataAgent.getGenre(movieID);


}





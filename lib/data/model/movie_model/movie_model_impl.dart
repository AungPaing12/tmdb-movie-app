import 'package:movie_app/data/vos/cast_vo/cast_vo.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app/persistent/actor_dao/actor_dao.dart';
import 'package:movie_app/persistent/actor_dao/actor_dao_impl.dart';
import 'package:movie_app/persistent/actor_detail_dao/actor_detail_dao.dart';
import 'package:movie_app/persistent/actor_detail_dao/actor_detail_dao_impl.dart';
import 'package:movie_app/persistent/cast_dao/cast_dao.dart';
import 'package:movie_app/persistent/cast_dao/cast_dao_impl.dart';
import 'package:movie_app/persistent/crew_dao/crew_dao.dart';
import 'package:movie_app/persistent/crew_dao/crew_dao_impl.dart';
import 'package:movie_app/persistent/genre_dao/genre_dao.dart';
import 'package:movie_app/persistent/genre_dao/genre_dao_impl.dart';
import 'package:movie_app/persistent/movie_dao/movie_dao.dart';
import 'package:movie_app/persistent/movie_dao/movie_dao_impl.dart';
import 'package:movie_app/persistent/movie_detail_dao/movie_detail_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../network/data_agent/movie_data_agent/movie_data_agent.dart';
import '../../../network/data_agent/movie_data_agent/movie_data_agent_impl.dart';
import '../../../network/response/movie_details_response/movie_details_response.dart';
import '../../../persistent/movie_detail_dao/movie_detail_dao.dart';
import '../../vos/actor_vo/actor_result_vo.dart';
import '../../vos/movie_genres_vo/movie_genres_vo.dart';
import '../../vos/movie_vo/result_vo.dart';
import 'movie_model.dart';

class MovieModelImpl extends MovieModel {
  MovieModelImpl._();

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();
  final MovieGenreDAO _movieGenreDAO = MovieGenreDAOImpl();
  final ActorDao _actorDao = ActorDaoImpl();
  final ActorDetailDao _actorDetailDao = ActorDetailDaoImpl();
  final MovieDAO _movieDAO = MovieDAOImpl();
  final CastDao _castDao = CastDaoImpl();
  final CrewDao _crewDao = CrewDaoImpl();

  final MovieDetailDao _movieDetailDao = MovieDetailDaoImpl();

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieID) =>
      _movieDataAgent.getMovieDetails(movieID).then((value) {
        if(value != null){
          _movieDetailDao.save(value);
        }
        return value;
      });

  @override
  Future<ActorDetailResponseVO?> getActorDetails(int actorID) =>
      _movieDataAgent.getActorDetails(actorID).then((value) {
        if (value != null) {
          _actorDetailDao.save(value);
          final actorData = value;
          if (actorData.deathday == null || actorData.deathday == '') {
            actorData.deathday = '-';
          }
          return actorData;
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getNowPlayingList() =>
      _movieDataAgent.getMoviesList().then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isGetNowPlaying = true;
            return e;
          }).toList();
          _movieDAO.save(value);
        }
        return value;
      });

  @override
  Future<List<ActorResultsVO>?> getActorList() =>
      _movieDataAgent.getActorList().then((value) {
        if (value != null) {
          _actorDao.save(value);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getTopRatedMovieList() =>
      _movieDataAgent.getTopRatedMovie().then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isTopRated = true;
            return e;
          }).toList();
          _movieDAO.save(value);
        }
        return value;
      });

  @override
  Future<List<MovieGenresVO>?> getMovieGenreList() =>
      _movieDataAgent.getMovieGenresList().then((value) {
        if (value != null) {
          _movieGenreDAO.saveGenreList(value);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getPopularMovieList() =>
      _movieDataAgent.getPopularMovieList().then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isPopularMovie = true;
            return e;
          }).toList();
          _movieDAO.save(value);
        }
        return value;
      });

  @override
  Future<List<CastVO>?> getCast(int movieID) =>
      _movieDataAgent.getCast(movieID).then((value) {
        if (value != null) {
          _castDao.save(value);
        }
        return value;
      });

  @override
  Future<List<CrewVO>?> getCrew(int movieID) =>
      _movieDataAgent.getCrew(movieID).then((value) {
        if (value != null) {
          _crewDao.save(value);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getSimilarMovieList(int movieID) =>
      _movieDataAgent.getSimilarMovieList(movieID).then((value) {
        if (value != null) {
          _movieDAO.save(value);
        }
        return value;
      });


  @override
  Stream<List<MovieGenresVO>?> getMovieGenreListFromDataBase() => _movieGenreDAO
      .watchGenreBox()
      .startWith(_movieGenreDAO.getGenreListFromDataBaseStream())
      .map((event) => _movieGenreDAO.getGenreListFromDataBase());

  @override
  Stream<ActorDetailResponseVO?> getActorDetailsFromDatabase(int actorID) =>
      _actorDetailDao
          .watchActorDetailBox()
          .startWith(
          _actorDetailDao.getActorDetailListFromDataBaseStream(actorID))
          .map((event) =>
              _actorDetailDao.getActorDetailListFromDataBase(actorID));

  @override
  Stream<List<ActorResultsVO>?> getActorListFromDatabase() => _actorDao
      .watchActorBox()
      .startWith(_actorDao.getActorListFromDataBaseStream())
      .map((event) => _actorDao.getActorListFromDataBase());

  @override
  Stream<List<MovieVO>?> getNowPlayingListFromDataBase() => _movieDAO
      .watchMovieBox()
      .startWith(_movieDAO.getNowPlayingListFromDataBaseStream())
      .map((event) => _movieDAO.getNowPlayingListFromDataBase());

  @override
  Stream<List<MovieVO>?> getPopularMovieListFromDataBase() => _movieDAO
      .watchMovieBox()
      .startWith(_movieDAO.getPopularListFromDataBaseStream())
      .map((event) => _movieDAO.getPopularListFromDataBase());

  @override
  Stream<List<MovieVO>?> getTopRatedMovieListFromDataBase() => _movieDAO
      .watchMovieBox()
      .startWith(_movieDAO.getTopRatedListFromDataBaseStream())
      .map((event) => _movieDAO.getTopRatedListFromDataBase());

  @override
  Stream<List<CastVO>?> getCastListFromDataBase(int movieID) => _castDao
      .watchCastBox()
      .startWith(_castDao.getCastListFromDataBaseStream(movieID))
      .map((event) => _castDao.getCastListFromDataBase(movieID));

  @override
  Stream<List<CrewVO>?> getCrewListFromDataBase(int movieID) => _crewDao
      .watchCrewBox()
      .startWith(_crewDao.getCrewListFromDataBaseStream(movieID))
      .map((event) => _crewDao.getCrewListFromDataBase(movieID));

  @override
  Stream<List<MovieVO>?> getSimilarMovieListFromDataBase(int movieID) =>
      _movieDAO
          .watchMovieBox()
          .startWith(_movieDAO.getSimilarMovieListFromDataBaseStream())
          .map((event) => _movieDAO.getSimilarMovieListFromDataBase());


  @override
  Stream<MovieDetailsResponse?> getMovieDetailsFromDatabase(int movieID) =>
      _movieDetailDao
          .watchActorDetailBox()
          .startWith(
          _movieDetailDao.getMovieDetailListFromDataBaseStream(movieID))
          .map((event) =>
              _movieDetailDao.getMovieDetailListFromDataBase(movieID));

  @override
  Future<List<MovieVO>?> getSearchMovie(String movieName) => _movieDataAgent.getSearchMovieList(movieName);
}

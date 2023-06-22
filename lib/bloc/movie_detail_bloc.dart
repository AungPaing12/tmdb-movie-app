import 'package:flutter/foundation.dart';
import 'package:movie_app/data/vos/crew_hive_vo/crew_hive_vo.dart';
import 'package:movie_app/data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';

import '../data/model/movie_model/movie_model.dart';
import '../data/model/movie_model/movie_model_impl.dart';
import '../data/vos/cast_hive_vo/cast_hive_vo.dart';
import '../network/response/movie_details_response/movie_details_response.dart';

class MovieDetailBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();
  final int movieID = 0;
  MovieDetailsResponse? _movieDetailList;
  CastHiveVO? _castVO;
  CrewHiveVO? _crewVO;
  MovieHiveVO? _similarMovieVO;
  bool _dispose = false;

  MovieDetailsResponse? get getMovieDetailList => _movieDetailList;

  CastHiveVO? get getCastList => _castVO;

  CrewHiveVO? get getCrewList => _crewVO;

  MovieHiveVO? get getRecommenedMovieList => _similarMovieVO;

  MovieDetailBloc(int movieID) {
    _movieModel.getMovieDetails(movieID);
    _movieModel.getMovieDetailsFromDatabase(movieID).listen((event) {
      if (event != null) {
        _movieDetailList = event;
      } else if (event == null) {
        _movieDetailList = null;
      }
      notifyListeners();
    });

    _movieModel.getSimilarMovieList(movieID);
    _movieModel.getSimilarMovieListFromDataBase(movieID).listen((event) {
      if (event != null) {
        _similarMovieVO = event;
      } else if (event == null) {
        _similarMovieVO = null;
      }
      notifyListeners();
    });

    _movieModel.getCast(movieID);
    _movieModel.getCastListFromDataBase(movieID).listen((event) {
      if (event != null) {
        _castVO = event;
      } else if (event == null) {
        _castVO = null;
      }
      notifyListeners();
    });

    _movieModel.getCrew(movieID);
    _movieModel.getCrewListFromDataBase(movieID).listen((event) {
      if (event != null) {
        _crewVO = event;
      } else if (event == null) {
        _crewVO = null;
      }
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}

import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo/actor_result_vo.dart';

import '../data/model/movie_model/movie_model.dart';
import '../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();

  List<MovieGenresVO> _genreList = [];
  List<MovieVO>? _movieList = [];
  List<MovieVO>? _getNowPlayingMovieList = [];
  List<MovieVO>? _youMayLikeMovieList = [];
  List<MovieVO>? _popularMovieList = [];
  List<ActorResultsVO>? _actorList = [];
  bool _dispose = false;

  List<MovieVO>? get getMovieList => _movieList;

  List<MovieGenresVO>? get getGenreList => _genreList;

  List<MovieVO>? get getNowPlayingMovieList => _getNowPlayingMovieList;

  List<MovieVO>? get youMayLikeMovieList => _youMayLikeMovieList;

  List<MovieVO>? get getPopularMovieList => _popularMovieList;

  List<ActorResultsVO>? get getActorList => _actorList;

  HomePageBloc() {
    _movieModel.getMovieGenreList();

    _movieModel.getNowPlayingList();

    _movieModel.getTopRatedMovieList();

    _movieModel.getPopularMovieList();

    _movieModel.getActorList();

    _movieModel.getMovieGenreListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _genreList = event;
        final firstData = _genreList.first;
        firstData.isSelect = true;
        _genreList.removeAt(0);
        _genreList.insert(0, firstData);
      } else {
        _genreList = [];
      }
      notifyListeners();
    });

    _movieModel.getNowPlayingListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _getNowPlayingMovieList = event.take(5).toList();
        _movieList = event;
      } else if (event == null) {
        _getNowPlayingMovieList = null;
        _movieList = null;
      } else {
        _getNowPlayingMovieList = [];
        _movieList = [];
      }
      notifyListeners();
    });

    _movieModel.getPopularMovieListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _popularMovieList = event;
      } else if (event == null) {
        _popularMovieList = null;
      } else {
        _popularMovieList = [];
      }
      notifyListeners();
    });

    _movieModel.getTopRatedMovieListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _youMayLikeMovieList = event;
      } else if (event == null) {
        _youMayLikeMovieList = null;
      } else {
        _youMayLikeMovieList = [];
      }
      notifyListeners();
    });

    _movieModel.getActorListFromDatabase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _actorList = event;
      } else if (event == null) {
        _actorList = null;
      } else {
        _actorList = [];
      }
      notifyListeners();
    });
  }

  void genreMovieIsSelected(MovieGenresVO genresVO) {
    _genreList = _genreList.map((e) {
      if (e == genresVO) {
        e.isSelect = true;
      } else {
        e.isSelect = false;
      }
      return e;
    }).toList();
    notifyListeners();
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

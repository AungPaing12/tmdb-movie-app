import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo/actor_result_vo.dart';
import 'package:movie_app/data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';
import '../data/model/movie_model/movie_model.dart';
import '../data/vos/movie_genres_vo/movie_genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();
  final ScrollController _scrollControllerForPopularMovie = ScrollController();
  final ScrollController _scrollControllerForTopRated = ScrollController();
  final ScrollController _scrollControllerForMovieByGenre = ScrollController();
  List<MovieGenresVO>? _genreList = [];
  MovieHiveVO? _movieList ;
  MovieHiveVO? _getNowPlayingMovieList ;
  List<MovieVO>? _youMayLikeMovieList = [];
  List<MovieVO>? _popularMovieList = [];
  List<ActorResultsVO>? _actorList = [];

  int pageCounterForPopularMovie = 1;
  int pageCounterForTopRatedMovie = 1;
  int pageCounterForMovieByGenre = 1;
  int genresID = 14;
  bool _dispose = false;

  MovieHiveVO? get getMovieList => _movieList;

  List<MovieGenresVO>? get getGenreList => _genreList;

  MovieHiveVO? get getNowPlayingMovieList => _getNowPlayingMovieList;

  List<MovieVO>? get youMayLikeMovieList => _youMayLikeMovieList;

  List<MovieVO>? get getPopularMovieList => _popularMovieList;

  List<ActorResultsVO>? get getActorList => _actorList;

  ScrollController get getScrollControllerForMovieByGenres =>
      _scrollControllerForMovieByGenre;

  ScrollController get getScrollControllerForPopularMovie =>
      _scrollControllerForPopularMovie;

  ScrollController get getScrollControllerForTopRatedMovie =>
      _scrollControllerForTopRated;

  HomePageBloc() {
    _movieModel.getMovieGenreList();

    _movieModel.getMovieByGenresList(genresID, pageCounterForMovieByGenre).then((value) {
      print("default id $genresID");
      return value;
    });

    _movieModel.getTopRatedMovieList(pageCounterForTopRatedMovie);

    _movieModel.getPopularMovieList(pageCounterForPopularMovie);

    _movieModel.getActorList();

    _movieModel.getMovieGenreListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _genreList = event;
        final firstData = _genreList?.first;
        firstData?.isSelect = true;
        _genreList?.removeAt(0);
        _genreList?.insert(0, firstData!);
      } else {
        _genreList = [];
      }
      notifyListeners();
    });

    _movieModel.getMovieByGenresListFromDataBase(genresID).listen((event) {
      if (event != null ) {
        _getNowPlayingMovieList = event;
        _movieList = event;
      } else if (event == null) {
        _getNowPlayingMovieList = null;
        _movieList = null;
      } else {
        _getNowPlayingMovieList ;
        _movieList ;
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

    ///Listen Get MovieByGenres Session of Scrolling
    _scrollControllerForMovieByGenre.addListener(() {
      if (_scrollControllerForMovieByGenre.position.atEdge) {
        pageCounterForMovieByGenre++;
        final pixel = _scrollControllerForMovieByGenre.position.pixels;
        if (pixel != 0) {
          _movieModel.getMovieByGenresList(
              genresID, pageCounterForMovieByGenre);
        }
      }
    });

    ///Listen Get PopularMovies Session of Scrolling
    _scrollControllerForPopularMovie.addListener(() {
      if (_scrollControllerForPopularMovie.position.atEdge) {
        pageCounterForPopularMovie++;
        final pixel = _scrollControllerForPopularMovie.position.pixels;
        if (pixel != 0) {
          _movieModel.getPopularMovieList(pageCounterForPopularMovie);
        }
      }
    });

    ///Listen Get TopRatedMovies Session of Scrolling
    _scrollControllerForTopRated.addListener(() {
      if (_scrollControllerForTopRated.position.atEdge) {
        pageCounterForTopRatedMovie++;
        final pixel = _scrollControllerForTopRated.position.pixels;
        if (pixel != 0) {
          _movieModel.getTopRatedMovieList(pageCounterForTopRatedMovie);
        }
      }
    });
  }

  void genreMovieIsSelected(MovieGenresVO genresVO) {
    _genreList = _genreList?.map((e) {
      if (e.id == genresVO.id) {
        e.isSelect = true;
      } else {
        e.isSelect = false;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  void getGenreID(int genreId){
    _movieModel.getMovieByGenresList(genreId, pageCounterForMovieByGenre);
    notifyListeners();
    print("genre bloc id $genreId");
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
    _scrollControllerForPopularMovie.dispose();
    _scrollControllerForTopRated.dispose();
    _scrollControllerForMovieByGenre.dispose();
  }
}

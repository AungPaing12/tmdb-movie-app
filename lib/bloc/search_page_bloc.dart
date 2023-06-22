import 'package:flutter/foundation.dart';
import 'package:movie_app/data/vos/movie_vo/result_vo.dart';

import '../data/model/movie_model/movie_model.dart';
import '../data/model/movie_model/movie_model_impl.dart';

class SearchPageBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();
  List<MovieVO> _searchMovieList = [];
  bool _dispose = false;

  List<MovieVO> get getSearchMovieList => _searchMovieList;

  void searchMovieName(String name) {
    _movieModel.getSearchMovie(name).then((value) {
      if (value != null) {
        _searchMovieList = value;
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
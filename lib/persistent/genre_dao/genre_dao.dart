import '../../data/vos/movie_genres_vo/movie_genres_vo.dart';

abstract class MovieGenreDAO{

  void saveGenreList(List<MovieGenresVO>? genreList);

  List<MovieGenresVO>? getGenreListFromDataBase();

  Stream watchGenreBox();

  Stream<List<MovieGenresVO>?> getGenreListFromDataBaseStream();
}
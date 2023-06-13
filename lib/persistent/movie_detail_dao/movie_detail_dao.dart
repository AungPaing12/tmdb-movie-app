import 'package:movie_app/network/response/movie_details_response/movie_details_response.dart';

abstract class MovieDetailDao {
  void save(MovieDetailsResponse? movieDetailList);

  MovieDetailsResponse? getMovieDetailListFromDataBase(int movieID);

  Stream<MovieDetailsResponse?> getMovieDetailListFromDataBaseStream(int movieID);

  Stream  watchActorDetailBox();

}

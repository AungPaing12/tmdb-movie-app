
import 'package:hive/hive.dart';
import 'package:movie_app/constant/hive_constant.dart';

import '../movie_vo/result_vo.dart';
part 'movie_hive_vo.g.dart';
@HiveType(typeId: kMovieHiveTypeID)
class MovieHiveVO {

  @HiveField(0)
  List<MovieVO>? movieList;


  MovieHiveVO(this.movieList);
}
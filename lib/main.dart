import 'package:flutter/material.dart';
import 'package:movie_app/constant/hive_constant.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/data/vos/cast_hive_vo/cast_hive_vo.dart';
import 'package:movie_app/data/vos/cast_vo/cast_vo.dart';
import 'package:movie_app/data/vos/crew_hive_vo/crew_hive_vo.dart';
import 'package:movie_app/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_app/data/vos/known_for_vo/known_for_vo.dart';
import 'package:movie_app/data/vos/movie_genres_vo/movie_genres_vo.dart';
import 'package:movie_app/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo/production_countries_vo.dart';
import 'package:movie_app/data/vos/recommend_movie_hive_vo/movie_hive_vo.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/vos/actor_vo/actor_result_vo.dart';
import 'network/response/movie_details_response/movie_details_response.dart';

MovieModel _movieModel = MovieModelImpl();

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ActorResultsVOAdapter());
  Hive.registerAdapter(CastVOAdapter());
  Hive.registerAdapter(CrewVOAdapter());
  Hive.registerAdapter(GenresVOAdapter());
  Hive.registerAdapter(KnownForVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(MovieGenresVOAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountriesVOAdapter());
  Hive.registerAdapter(ActorDetailResponseVOAdapter());
  Hive.registerAdapter(MovieDetailsResponseAdapter());
  Hive.registerAdapter(CastHiveVOAdapter());
  Hive.registerAdapter(CrewHiveVOAdapter());
  Hive.registerAdapter(MovieHiveVOAdapter());

  await Hive.openBox<MovieGenresVO>(kBoxNameForMovieGenreVO);
  await Hive.openBox<MovieVO>(kBoxNameForMovieVO);
  await Hive.openBox<ActorResultsVO>(kBoxNameForActorVO);
  await Hive.openBox<ActorDetailResponseVO>(kBoxNameForActorDetailVO);
  await Hive.openBox<ProductionCompaniesVO>(kBoxNameForProductionCompanyVO);
  await Hive.openBox<GenresVO>(kBoxNameForMovieDetailGenreVO);
  await Hive.openBox<MovieDetailsResponse>(kBoxNameForMovieDetailVO);
  await Hive.openBox<CastHiveVO>(kBoxNameForCastHiveVO);
  await Hive.openBox<CrewHiveVO>(kBoxNameForCrewHiveVO);
  await Hive.openBox<MovieHiveVO>(kBoxNameForMovieHiveVO);
  runApp(const MyApp());
  // _movieModel.getPopularMovieList(1);
  // _movieModel.getPopularMovieListFromDataBase().listen((value) => print("Movie List==============>$value")).onError((onError){
  //   print(onError);
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

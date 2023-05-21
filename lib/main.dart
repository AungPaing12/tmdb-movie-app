import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/page/home_page.dart';

MovieModel _movieModel = MovieModelImpl();

void main() {
  runApp(const MyApp());
  // _movieModel.getActorDetails(15737).then((value) => print("Movie Lie==============>$value")).catchError((onError){
  //   print(onError);
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
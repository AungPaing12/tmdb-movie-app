import 'package:flutter/material.dart';
import 'package:movie_app/constant/dimens.dart';

import '../view_item/home_page_view_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: const [
            SizedBox(
              height: kSP30x,
            ),
            SearchMovieBarAndSearchIconViewItem(),
            MovieGenreScrollViewItem(),
            SizedBox(
              height: kSP20x,
            ),
            FirstScrollImgaeWithPlayButtomViewItem(),
            SmallestMoviesScrollViewItem(),
            YouMayLikeMovieViewItem(),
            PopularMovieViewItem(),
            ActorsViewItem(),
          ],
        ),
      ),
    );
  }
}

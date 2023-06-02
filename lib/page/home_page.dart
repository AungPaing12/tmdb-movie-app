import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import '../view_item/home_page_view_item.dart';
import '../widgets/actors_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchMovieBarAndSearchIconViewItem(),
            MovieTypeScrollItemView(),
            CarouselSliderViewItem(),
            SmallestMovieViewItem(),
            TopRatedMovieViewItem(),
            PopularMoviesView(),
            ActorViewItem(),
          ],
        ),
      ),
    );
  }
}

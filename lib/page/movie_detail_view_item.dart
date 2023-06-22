import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/movie_detail_bloc.dart';
import '../widgets/movie_details_widget.dart';

class MovieDetailViewItem extends StatelessWidget {
  const MovieDetailViewItem({super.key, required this.movieID});

  final int movieID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieDetailBloc(movieID),
      child: Consumer<MovieDetailBloc>(
        builder: (context, bloc, child) => AboutMovieAndRecommendMovie(
          castHiveVO: bloc.getCastList,
          crewVO: bloc.getCrewList,
          similarMovieVO: bloc.getRecommenedMovieList,
          movieDetailsResponse: bloc.getMovieDetailList,
        ),
      ),
    );
  }
}

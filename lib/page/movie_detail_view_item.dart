import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/network/response/movie_details_response/movie_details_response.dart';
import '../data/vos/cast_vo/cast_vo.dart';
import '../data/vos/crew_vo/crew_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/result_vo.dart';
import '../widgets/movie_details_widget.dart';

class MovieDetailViewItem extends StatefulWidget {
  const MovieDetailViewItem({Key? key, required this.movieID})
      : super(key: key);
  final int movieID;

  @override
  State<MovieDetailViewItem> createState() => _MovieDetailViewItemState();
}

class _MovieDetailViewItemState extends State<MovieDetailViewItem> {
  final MovieModel _movieModel = MovieModelImpl();
  MovieDetailsResponse? movieDetailsResponse;
  List<CastVO>? castVO;
  List<CrewVO>? crewVO;
  List<MovieVO>? similarMovieVo;

  @override
  void initState() {
    _movieModel.getMovieDetails(widget.movieID);
    _movieModel.getMovieDetailsFromDatabase(widget.movieID).listen((event) {
      if (mounted) {
        setState(() {
          movieDetailsResponse = event;
        });
      }
    });
    _movieModel.getSimilarMovieList(widget.movieID);
    _movieModel.getSimilarMovieListFromDataBase(widget.movieID).listen((event) {
      if (mounted) {
        setState(() {
          similarMovieVo = event;
        });
      }
    });
    _movieModel.getCrew(widget.movieID);
    _movieModel.getCrewListFromDataBase(widget.movieID).listen((event) {
      if (mounted) {
        setState(() {
          crewVO = event;
        });
      }
    });
    _movieModel.getCast(widget.movieID);
    _movieModel.getCastListFromDataBase(widget.movieID).listen((event) {
      if (mounted) {
        setState(() {
          castVO = event;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: (similarMovieVo == null && castVO == null && crewVO == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : MovieDetail(
              movieDetailsResponse: movieDetailsResponse,
              castVO: castVO,
              crewVO: crewVO,
              similarMovieVO: similarMovieVo,
            ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    Key? key,
    required this.movieDetailsResponse,
    required this.similarMovieVO,
    required this.castVO,
    required this.crewVO,
  }) : super(key: key);
  final MovieDetailsResponse? movieDetailsResponse;
  final List<MovieVO>? similarMovieVO;
  final List<CastVO>? castVO;
  final List<CrewVO>? crewVO;

  @override
  Widget build(BuildContext context) {
    return AboutMovieAndRecommendMovie(
      castVO: castVO,
      crewVO: crewVO,
      similarMovieVO: similarMovieVO,
      movieDetailsResponse: movieDetailsResponse,
    );
  }
}

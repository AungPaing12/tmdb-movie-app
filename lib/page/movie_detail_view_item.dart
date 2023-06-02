import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/network/response/movie_details_response/movie_details_response.dart';
import '../data/vos/cast_vo/cast_vo.dart';
import '../data/vos/crew_vo/crew_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../data/vos/production_companies_vo/production_companies_vo.dart';
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
  List<PopularMovieResultsVO>? similarMovieVo;
  List<ProductionCompaniesVO>? productionCompanyVO;
  List<GenresVO>? genreVO;

  @override
  void initState() {
    _movieModel.getMovieDetails(widget.movieID).then((movieDetail) {
      setState(() {
        movieDetailsResponse = movieDetail;
      });
    });
    _movieModel.getSimilarMovieList(widget.movieID).then((similarMovie) {
      setState(() {
        similarMovieVo = similarMovie;
      });
    });
    _movieModel.getCrew(widget.movieID).then((crew) {
      setState(() {
        crewVO = crew;
      });
    });
    _movieModel.getCast(widget.movieID).then((cast) {
      setState(() {
        castVO = cast;
      });
    });
    _movieModel
        .getProductionCompanyList(widget.movieID)
        .then((productionCompany) {
      setState(() {
        productionCompanyVO = productionCompany;
      });
    });
    _movieModel.getGenre(widget.movieID).then((genre) {
      setState(() {
        genreVO = genre;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: (movieDetailsResponse == null &&
          similarMovieVo == null &&
          castVO == null &&
          crewVO == null &&
          productionCompanyVO == null)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : MovieDetail(
        movieDetailsResponse: movieDetailsResponse,
        castVO: castVO,
        crewVO: crewVO,
        similarMovieVO: similarMovieVo,
        productionCompanyVO: productionCompanyVO,
        genreVO: genreVO,
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key,
    required this.movieDetailsResponse,
    required this.similarMovieVO,
    required this.castVO,
    required this.crewVO,
    required this.productionCompanyVO, required this.genreVO})
      : super(key: key);
  final MovieDetailsResponse? movieDetailsResponse;
  final List<PopularMovieResultsVO>? similarMovieVO;
  final List<CastVO>? castVO;
  final List<CrewVO>? crewVO;
  final List<ProductionCompaniesVO>? productionCompanyVO;
  final List<GenresVO>? genreVO;

  @override
  Widget build(BuildContext context) {

    return AboutMovieAndRecommendMovie(
        castVO: castVO,
        crewVO: crewVO,
        productionCompanyVO: productionCompanyVO,
        similarMovieVO: similarMovieVO,
        movieDetailsResponse: movieDetailsResponse,
        genresVO: genreVO
    );
  }
}

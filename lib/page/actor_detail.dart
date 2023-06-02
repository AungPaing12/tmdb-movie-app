import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import '../data/vos/popular_movies_result_vo/popular_movie_result_vo.dart';
import '../network/response/actor_detail_response/actor_detail_response.dart';
import '../widgets/actor_detail_widget.dart';

class ActorDetailViewItem extends StatefulWidget {
  const ActorDetailViewItem({Key? key, required this.actorID})
      : super(key: key);
  final int actorID;

  @override
  State<ActorDetailViewItem> createState() => _ActorDetailViewItemState();

}

class _ActorDetailViewItemState extends State<ActorDetailViewItem> {
  final MovieModel _movieModel = MovieModelImpl();
  ActorDetailResponseVO? actorDetailResponseVO;
  List<PopularMovieResultsVO>? popularMovieVO;
  @override
  void initState() {
    _movieModel.getActorDetails(widget.actorID).then((actorList) {
      setState(() {
        actorDetailResponseVO = actorList;
      });
    _movieModel.getPopularMovieList().then((popularMovie) {
      popularMovieVO = popularMovie;
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: (actorDetailResponseVO == null && popularMovieVO == null) ? const Center(
        child: CircularProgressIndicator()) :
       ActorDetail(actorDetailResponseVO: actorDetailResponseVO, popularMovieVO: popularMovieVO,)
    );
  }
}


class ActorDetail extends StatelessWidget {
  const ActorDetail({Key? key, required this.actorDetailResponseVO, required this.popularMovieVO})
      : super(key: key);
  final ActorDetailResponseVO? actorDetailResponseVO;
  final List<PopularMovieResultsVO>? popularMovieVO;
  @override
  Widget build(BuildContext context) {
    return  ActorsInfoAndHisMovies(popularMovieVO: popularMovieVO,actorDetailResponseVO: actorDetailResponseVO,);
  }
}

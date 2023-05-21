import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import '../network/response/actor_detail_response/actor_detail_response.dart';
import '../widgets/actor_detail_widget.dart';

MovieModel _movieModel = MovieModelImpl();

class ActorDetailViewItem extends StatelessWidget {
  const ActorDetailViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder <ActorDetailResponseVO?> (
        future: _movieModel.getActorDetails(15737),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Error Fetching"),
            );
          }
          final actorDetail = snapShot.data;
          return ActorDetail(actorDetailResponseVO: actorDetail,);
        });
  }
}


class ActorDetail extends StatelessWidget {
  const ActorDetail({Key? key, required this.actorDetailResponseVO}) : super(key: key);
  final ActorDetailResponseVO? actorDetailResponseVO;
  @override
  Widget build(BuildContext context) {
    return ActorsInfoAndHisMovies(
      actorImageURL
      :actorDetailResponseVO?.profilePath ?? '',
      actorName
      :actorDetailResponseVO?.name ?? '',
      biography
      :actorDetailResponseVO?.biography ?? '',
      birthday
      :actorDetailResponseVO?.birthday ?? '',
      deadDay
      :actorDetailResponseVO?.deathday ?? '',
      gender
      :actorDetailResponseVO?.gender ?? 0,
      placeOfBirth
      :actorDetailResponseVO?.placeOfBirth ?? '',
      popularity
      :actorDetailResponseVO?.popularity ?? 0,);
  }
}

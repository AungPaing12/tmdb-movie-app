import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/actor_detail_bloc.dart';
import '../network/response/actor_detail_response/actor_detail_response.dart';
import '../widgets/actor_detail_widget.dart';

class ActorDetailViewItem extends StatelessWidget {
  const ActorDetailViewItem({super.key, required this.actorID});

  final int actorID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActorDetailBloc(actorID),
      child: Selector<ActorDetailBloc, ActorDetailResponseVO?>(
        selector: (_, bloc) => bloc.getActorDetailList,
        builder: (context, actorDetail, child) {
          if (actorDetail == null) {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          return ActorsInfoAndHisMovies(actorDetailResponseVO: actorDetail ,popularMovieVO: const [],);
        })
      );
  }
}

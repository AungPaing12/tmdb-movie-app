import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/actor_detail_bloc.dart';
import '../data/vos/known_for_vo/known_for_vo.dart';
import '../widgets/actor_detail_widget.dart';

class ActorDetailViewItem extends StatelessWidget {
  const ActorDetailViewItem({super.key, required this.actorID, required this.knownForVO});

  final int actorID;
  final List<KnownForVO>? knownForVO;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActorDetailBloc(actorID),
      builder: (context, _) {
        return  ActorsInfoAndHisMovies(movieList: knownForVO,);
      },
    );
  }
}

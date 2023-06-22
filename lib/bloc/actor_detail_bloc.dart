import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';

class ActorDetailBloc extends ChangeNotifier {
  final MovieModel _movieModel = MovieModelImpl();
  ActorDetailResponseVO? _actorDetailList;
  bool _dispose = false;
  ActorDetailResponseVO? get getActorDetailList => _actorDetailList;

  ActorDetailBloc(int actorID) {
    _movieModel.getActorDetails(actorID);
    _movieModel.getActorDetailsFromDatabase(actorID).listen((event) {
      if (event != null ) {
        _actorDetailList = event;
      } else if (event == null) {
        _actorDetailList = null;
      }
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}

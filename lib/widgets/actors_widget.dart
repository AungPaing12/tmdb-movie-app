import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_model/movie_model.dart';
import 'package:movie_app/data/model/movie_model/movie_model_impl.dart';
import 'package:movie_app/widgets/easy_text.dart';

import '../constant/api_constant.dart';
import '../constant/dimens.dart';
import '../data/vos/actor_vo/actor_result_vo.dart';
import 'actor_detail_widget.dart';

final MovieModel _movieModel = MovieModelImpl();

class ActorViewItem extends StatelessWidget {
  const ActorViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActorResultsVO>?>(
        future: _movieModel.getActorList(),
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
          final listActor = snapShot.data;
          return Actor(
            actorResultsVO: listActor,
          );
        });
  }
}

class Actor extends StatelessWidget {
  const Actor({Key? key, required this.actorResultsVO}) : super(key: key);
  final List<ActorResultsVO>? actorResultsVO;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP20x),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 350,
          aspectRatio: 5 / 3,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 1),
          autoPlayAnimationDuration: const Duration(seconds: 5),
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: actorResultsVO?.map((actor) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: kSP5x),
                //decoration: const BoxDecoration(color: Colors.amber),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const JasonStathamInfoAndHisMovies()));
                    },
                    child: CachedNetworkImage(
                      imageUrl: '$kPrefixEndPoint${actor.profilePath ?? ''}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:
                                  Image.asset('images/tmdb_place_holder.png'))),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 25),
                child: Align(alignment: Alignment.bottomCenter,
                    child: EasyText(text: actor.name ?? '',fontWeight: FontWeight.w600,fontSize: 20,)),
              ),
              Positioned.fill(
                top: 150,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class JasonStathamInfoAndHisMovies extends StatelessWidget {
  const JasonStathamInfoAndHisMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ActorsInfoAndHisMovies(
                    actorName: 'Jason Statham',
                    placeOfBirth: "Shirebrook, "
                        "Derbyshire, England, UK",
                    birthday: '1967-7-26',
                    deadDay: '-',
                    gender: 1,
                    popularity: 324.3,
                    biography:
                        "Jason Statham was born in Shirebrook, Derbyshire, to Eileen (Yates), a dancer, and Barry Statham, a street merchant and lounge singer. He was a Diver on the British National Diving Team and finished twelfth in the World Championships in 1992. He has also been a fashion model, black market salesman and finally of course, actor. He received the audition for his debut role as Bacon in Lock, Stock and Two Smoking Barrels (1998) through French Connection, for whom he was modeling. They became a major investor in the film and introduced Jason to Guy Ritchie, who invited him to audition for a part in the film by challenging him to impersonate an illegal street vendor and convince him to purchase fake jewelry.",
                    actorImageURL:
                        'https://www.onthisday.com/images/people/jason-statham-medium.jpg')));
          },
          child: CachedNetworkImage(
            imageUrl:
                'https://www.onthisday.com/images/people/jason-statham-medium.jpg',
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('images/tmdb_place_holder.png'))),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}

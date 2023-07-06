import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/easy_text.dart';
import '../constant/api_constant.dart';
import '../constant/dimens.dart';
import '../data/vos/actor_vo/actor_result_vo.dart';
import '../page/actor_detail.dart';

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
                          builder: (context) => ActorDetailViewItem(
                                actorID: actor.id ?? 0, knownForVO: actor.knownFor?? [],
                              )));
                    },
                    child: CachedNetworkImage(
                      imageUrl: '$kPrefixEndPoint${actor.profilePath ?? ''}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  'images/tmdb_place_holder.png'))),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: EasyText(
                      text: actor.name ?? '',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    )),
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

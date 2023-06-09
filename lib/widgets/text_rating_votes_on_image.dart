import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/easy_text.dart';

import '../constant/api_constant.dart';
import '../page/movie_detail_view_item.dart';

class TextRatingVotesOnImages extends StatelessWidget {
  const TextRatingVotesOnImages(
      {Key? key,
      required this.imageURL,
      required this.movieName,
      required this.rating,
      required this.votes,
      required this.positionFillTop1,
      required this.movieID})
      : super(key: key);
  final String imageURL;
  final String movieName;
  final double rating;
  final int votes;
  final double positionFillTop1;
  final int movieID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 180,
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetailViewItem(
                            movieID: movieID,
                          )));
                },
                child: CachedNetworkImage(
                  imageUrl: kPrefixEndPoint + imageURL,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) => Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/tmdb_place_holder.png',
                            fit: BoxFit.cover,
                          ))),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Positioned.fill(
              top: positionFillTop1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
                left: 10,
                bottom: 40,
                child: SizedBox(
                    width: 150,
                    child: EasyText(
                      text: movieName,
                      color: kWhiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ))),
            Positioned(
              left: 10,
              bottom: 12,
              child: Row(
                children: [
                  const Icon(
                    Icons.star_border_purple500_outlined,
                    color: kYellowAccentColor,
                    size: 15,
                  ),
                  EasyText(
                    text: '$rating',
                    color: kYellowAccentColor,
                    fontSize: 13,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  EasyText(
                    text: '${votes}vote',
                    color: kYellowAccentColor,
                    fontSize: 13,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

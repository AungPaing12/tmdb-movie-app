import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/actors_widget.dart';

import '../constant/api_constant.dart';
import 'easy_text.dart';

class ListTileItemView extends StatelessWidget {
  const ListTileItemView(
      {Key? key,
      required this.imageURL,
      required this.actors,
      required this.actorsName,
      required this.radius,
      required this.genderID})
      : super(key: key);
  final String imageURL;
  final String actors;
  final String actorsName;
  final double radius;
  final int genderID;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: radius,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                width: 50,
                height: 50,
                imageUrl:
                kPrefixEndPoint+imageURL,
                placeholder: (context, url) =>
                    Image.asset('images/tmdb_place_holder.png'),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            EasyText(
                text: (genderID == 1)
                    ? 'Actress'
                    : (genderID == 2)
                        ? 'Actor'
                        : 'Crew',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kWhiteColor),
            EasyText(
              text: actorsName,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kGreyColor,
            ),
          ],
        )
      ],
    );
  }
}

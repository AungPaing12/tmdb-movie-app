import 'package:flutter/material.dart';
import 'package:movie_app/constant/strings.dart';

import 'more_info_widget.dart';

class ActorInfoWidget extends StatelessWidget {
  const ActorInfoWidget(
      {Key? key,
      required this.placeOfBirth,
      required this.birthday,
      required this.deadDay,
      required this.gender,
      required this.popularity})
      : super(key: key);
  final String placeOfBirth;
  final String birthday;
  final String deadDay;
  final int gender;
  final double popularity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MoreInformationView(
              generalInfo: kPlaceOfBirthText,
              actorsInfo: placeOfBirth,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MoreInformationView(
              generalInfo: kBirthdayText,
              actorsInfo: birthday,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MoreInformationView(
              generalInfo: kDeadDayText,
              actorsInfo: deadDay,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MoreInformationView(
                generalInfo: kGenderText,
                actorsInfo: (gender == 2) ? "Male" : "Female")),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MoreInformationView(
                generalInfo: kPopularityText, actorsInfo: '$popularity')),
      ],
    );
  }
}

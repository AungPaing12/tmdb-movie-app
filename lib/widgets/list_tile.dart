import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/actors_widget.dart';

import 'easy_text.dart';

class ListTileItemView extends StatelessWidget {
  const ListTileItemView({Key? key, required this.imageURL, required this.actors, required this.actorsName, required this.radius}) : super(key: key);
  final String imageURL;
  final String actors;
  final String actorsName;
  final double radius;
  @override
  Widget build(BuildContext context) {
   return Row(
     children: [
       Padding(
         padding: const EdgeInsets.only(left: 10),
         child: CircleAvatar(
           radius: radius,
           backgroundImage: NetworkImage(imageURL),
         ),
       ),
       const SizedBox(
         width: 5,
       ),
       Column(
         children: [
           EasyText(text: actors,fontSize: 14,fontWeight: FontWeight.w600,color: kWhiteColor,),
           EasyText(text: actorsName,fontSize: 14,fontWeight: FontWeight.w600,color: kGreyColor,),
         ],
       )
     ],
   );
  }
}

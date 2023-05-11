import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/easy_text.dart';

class MovieGenre extends StatelessWidget {
  const MovieGenre({Key? key, required this.text}) : super(key: key);
  final String text ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Container(
        width: 70,
        height: 20,

        decoration: BoxDecoration(
          color: KPinkAccentColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: EasyText(text: text,color: kWhiteColor,fontSize: 13,fontWeight: FontWeight.w600,)),
      ),
    );
  }
}

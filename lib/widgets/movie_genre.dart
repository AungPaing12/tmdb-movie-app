import 'package:flutter/material.dart';
import 'package:movie_app/constant/colors.dart';
import 'package:movie_app/widgets/easy_text.dart';

class MovieGenre extends StatelessWidget {
  const MovieGenre({Key? key, required this.text, this.color})
      : super(key: key);
  final String text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: 80,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: EasyText(
          text: text,
          color: kWhiteColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }
}

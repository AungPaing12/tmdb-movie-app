import 'package:flutter/material.dart';
class EasyText extends StatelessWidget {
  const EasyText(
      {Key? key,
        required this.text,
        this.color = Colors.white,
        this.fontSize = 14,
        this.fontWeight = FontWeight.w400})
      : super(key: key);
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style:
      TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

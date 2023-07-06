import 'package:flutter/material.dart';

import '../constant/dimens.dart';
import 'easy_text.dart';

class MoreInformationView extends StatelessWidget {
  const MoreInformationView(
      {Key? key, required this.generalInfo, required this.actorsInfo})
      : super(key: key);
  final String generalInfo;
  final String actorsInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: kSP40x,
            width: kSp130x,
            child: EasyText(
              text: generalInfo,
              fontWeight: FontWeight.w400,fontSize: 16,
            )),
        Flexible(
            child: EasyText(text: actorsInfo, fontWeight: FontWeight.w400,fontSize: 16,)),
      ],
    );
  }
}
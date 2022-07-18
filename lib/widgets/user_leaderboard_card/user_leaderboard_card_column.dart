import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:hee8_lb/utils/constants.dart';

class UserLeaderboardCardColumn extends StatelessWidget {
  final String topText;
  final String bottomText;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;

  const UserLeaderboardCardColumn({
    Key? key,
    required this.topText,
    required this.bottomText,
    this.padding,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AutoSizeText(
            topText,
            style: TextStyle(
              fontFamily: kIBMPlexSans,
              color: textColor ?? const Color(0xff838383)
            ),
            maxLines: 2,
            minFontSize: 5,
          ),
          AutoSizeText(
            bottomText,
            style: const TextStyle(
              fontFamily: kIBMPlexSans,
              color: Colors.white
            ),
            maxLines: 2,
            minFontSize: 5,
          ),
        ],
      ),
    );
  }
}
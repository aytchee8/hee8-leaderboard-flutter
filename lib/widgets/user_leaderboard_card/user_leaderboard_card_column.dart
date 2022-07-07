import 'package:flutter/material.dart';

import 'package:hee8_lb/utils/constants.dart';

class UserLeaderboardCardColumn extends StatelessWidget {
  final String topText;
  final String bottomText;
  final EdgeInsetsGeometry? padding;

  const UserLeaderboardCardColumn({
    Key? key,
    required this.topText,
    required this.bottomText,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            topText,
            style: const TextStyle(
              fontFamily: kIBMPlexSans,
              color: Color(0xff838383)
            )
          ),
          Text(
            bottomText,
            style: const TextStyle(
              fontFamily: kIBMPlexSans,
              color: Colors.white
            )
          ),
        ],
      ),
    );
  }
}
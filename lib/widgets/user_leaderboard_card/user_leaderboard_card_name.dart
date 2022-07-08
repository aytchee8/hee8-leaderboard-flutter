import 'package:flutter/material.dart';

import 'package:hee8_lb/utils/constants.dart';

class UserLeaderboardCardName extends StatelessWidget {
  final String name;
  final int discriminator;

  const UserLeaderboardCardName(this.name, this.discriminator, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white, fontFamily: kIBMPlexSans, fontSize: 19),
        children: [
          TextSpan(
            text: name,
          ),
          TextSpan(
            text: "#$discriminator", style: TextStyle(color: Colors.white.withOpacity(0.2)),
          )
        ]
      ),
    );
  }
}
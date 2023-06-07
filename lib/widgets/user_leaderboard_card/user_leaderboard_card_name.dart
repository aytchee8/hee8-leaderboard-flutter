import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hee8_lb/utils/constants.dart';

class UserLeaderboardCardName extends StatelessWidget {
  final String name;
  final String discriminator;
  final Color? discriminatorColor;

  const UserLeaderboardCardName(this.name, this.discriminator, {Key? key, this.discriminatorColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(children: [
        TextSpan(
          text: name,
        ),
        if (discriminator != "0")
          TextSpan(
            text: "#$discriminator",
            style: TextStyle(color: discriminatorColor ?? Colors.white.withOpacity(0.2)),
          )
      ]),
      style: const TextStyle(color: Colors.white, fontFamily: kIBMPlexSans, fontSize: 19),
      maxLines: 1,
      minFontSize: 5,
      overflow: TextOverflow.ellipsis,
    );
  }
}

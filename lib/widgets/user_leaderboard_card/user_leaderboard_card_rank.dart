import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:hee8_lb/utils/constants.dart';

class UserLeaderboardCardRank extends StatelessWidget {
  final int rank;

  const UserLeaderboardCardRank(this.rank, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buildColor(),
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        rank.toString(),
        style: const TextStyle(
          fontFamily: kIBMPlexSans,
          fontSize: 19,
          fontWeight: FontWeight.bold,
          shadows: [],
          color: Colors.white
        ),
        maxFontSize: 19,
      ),
    );
  }

  Color buildColor() {
    if (rank == 1) {
      return const Color(0xffD08C2E);
    } else if (rank == 2) {
      return const Color(0xff868686);
    } else if (rank == 3) {
      return const Color(0xff9d6132);
    } else {
      return const Color.fromARGB(255, 40, 45, 49);
    }
  }
}
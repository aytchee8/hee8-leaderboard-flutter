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
        color: const Color(0xffD08C2E),
      ),
      alignment: Alignment.center,
      child: Text(rank.toString(), style: const TextStyle(fontFamily: kIBMPlexSans, fontSize: 19, fontWeight: FontWeight.bold)),
    );
  }
}
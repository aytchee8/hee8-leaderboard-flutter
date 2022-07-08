import 'package:flutter/material.dart';

import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_avatar.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_column.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_name.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_rank.dart';

class UserLeaderboardCard extends StatelessWidget {
  const UserLeaderboardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UserLeaderboardCardRank(1),
          const UserLeaderboardCardAvatar("https://cdn.discordapp.com/avatars/385074102467297280/a_23894a61b5e4de7b06152259b6ba92aa.gif"),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const UserLeaderboardCardName("Darko", 5590),
                Row(
                  children: const [
                    UserLeaderboardCardColumn(topText: "Level", bottomText: "87"),
                    UserLeaderboardCardColumn(
                      topText: "Message Count",
                      bottomText: "65.8k",
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                    UserLeaderboardCardColumn(topText: "Total XP", bottomText: "1.3m"),
                  ],
                )
              ],
            ),
        ]
      )
    );
  }
}
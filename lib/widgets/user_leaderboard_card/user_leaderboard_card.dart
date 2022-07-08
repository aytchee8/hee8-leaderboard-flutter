import 'package:flutter/material.dart';

import 'package:hee8_lb/models/user.dart';

import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_avatar.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_column.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_name.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_rank.dart';

class UserLeaderboardCard extends StatelessWidget {
  final User user;

  const UserLeaderboardCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UserLeaderboardCardRank(1),
          UserLeaderboardCardAvatar(user.avatarURL),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserLeaderboardCardName(user.username, user.discriminator),
                Row(
                  children: [
                    UserLeaderboardCardColumn(topText: "Level", bottomText: user.level.toString()),
                    UserLeaderboardCardColumn(
                      topText: "Message Count",
                      bottomText: user.messageCount.toString(),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                    ),
                    UserLeaderboardCardColumn(topText: "Total XP", bottomText: user.xp.toString()),
                  ],
                )
              ],
            ),
        ]
      )
    );
  }
}
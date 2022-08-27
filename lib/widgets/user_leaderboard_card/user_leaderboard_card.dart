import 'package:flutter/material.dart';

import 'package:hee8_lb/models/user.dart';

import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_avatar.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_column.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_name.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_rank.dart';

class UserLeaderboardCard extends StatelessWidget {
  final User user;
  final int rank;

  const UserLeaderboardCard(this.user, this.rank, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: user.bannerURL == null
        ? _child(false)
        : _buildWithBackground()
    );
  }

  Widget _buildWithBackground() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xff21262B),
        image: DecorationImage(
          image: NetworkImage(user.bannerURL!),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          shadows: <Shadow>[
            Shadow(
              offset: Offset(3.0, 3.0),
              blurRadius: 3.0,
              color: Colors.black,
            ),
            Shadow(
              offset: Offset(3.0, 3.0),
              blurRadius: 8.0,
              color: Colors.black,
            ),
          ],
        ),
        child: _child(true),
      )
    );
  }

  Widget buildAvatar(bool shadow) {
   if (shadow) {
     return Container(
       decoration: const BoxDecoration(
         shape: BoxShape.circle,
         boxShadow: [
           BoxShadow(
             offset: Offset(2.0, 2.0),
             blurRadius: 3.0,
             color: Colors.black,
           ),
           BoxShadow(
             offset: Offset(2.0, 2.0),
             blurRadius: 8.0,
             color: Colors.black,
           ),
         ]
       ),
       child: UserLeaderboardCardAvatar(user.avatarURL, user.xp, user.level),
     );
   } else {
     return UserLeaderboardCardAvatar(user.avatarURL, user.xp, user.level);
   }
  }

  Widget _child(bool shadow) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserLeaderboardCardRank(rank),
          buildAvatar(shadow),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserLeaderboardCardName(
                  user.username,
                  user.discriminator,
                  discriminatorColor: shadow ? const Color(0xffBBBBBB) : null
                ),
                Wrap(
                  children: [
                    UserLeaderboardCardColumn(
                      topText: "Level",
                      bottomText: user.level.toString(),
                      padding: const EdgeInsets.only(right: 10),
                      textColor: shadow ? const Color(0xffc6c6c6) : null
                    ),
                    UserLeaderboardCardColumn(
                      topText: "Message Count",
                      bottomText: user.messageCount.toString(),
                      padding: const EdgeInsets.only(right: 10),
                      textColor: shadow ? const Color(0xffc6c6c6) : null
                    ),
                    UserLeaderboardCardColumn(
                      topText: "Total XP",
                      bottomText: user.xp.toString(),
                      textColor: shadow ? const Color(0xffc6c6c6) : null
                    ),
                  ],
                )
              ],
            ),
          ),
        ]
      )
    );
  }
}
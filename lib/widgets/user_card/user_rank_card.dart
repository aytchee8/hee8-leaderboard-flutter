import 'package:flutter/material.dart';
import 'package:hee8_lb/bloc/user/bloc/user_bloc.dart';
import 'package:hee8_lb/models/user.dart';
import 'package:hee8_lb/widgets/user_card/logout_button.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_avatar.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_column.dart';
import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card_name.dart';

class UserRankCard extends StatelessWidget {
  final User user;
  final UserBloc userBloc;

  const UserRankCard(this.user, this.userBloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserLeaderboardCardAvatar(user.avatarURL, padding: const EdgeInsets.only(right: 10)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: UserLeaderboardCardName(user.username, user.discriminator)),
                  LogoutButton(onPressed: () {
                    userBloc.add(LogoutUserEvent());
                  })
                ],
              ),
              Row(
                children: [
                  UserLeaderboardCardColumn(topText: "Level", bottomText: user.level.toString()),
                  UserLeaderboardCardColumn(
                    topText: "Rank",
                    bottomText: user.rank.toString(),
                    padding: const EdgeInsets.only(left: 10)
                  ),
                ],
              )
            ],
          ),
        ),
      ]
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hee8_lb/bloc/leaderboard_bloc.dart';
import 'package:hee8_lb/injection_container.dart';

import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            color: const Color(0xff21262B),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(1.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: _buildLeaderboard()
        )
      )
    );
  }

  BlocProvider<LeaderboardBloc> _buildLeaderboard() {
    return BlocProvider(
      create: (_) => sl<LeaderboardBloc>()..add(GetLeaderboardUsers()),
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is LeaderboardError) {
            return Center(child: Text(state.message));
          } else if (state is LeaderboardLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return UserLeaderboardCard(state.users.elementAt(index));
              },
            );
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
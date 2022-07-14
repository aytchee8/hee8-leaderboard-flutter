import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hee8_lb/bloc/leaderboard/leaderboard_bloc.dart';

import 'package:hee8_lb/injection_container.dart';
import 'package:hee8_lb/utils/utils.dart';

import 'package:hee8_lb/widgets/user_leaderboard_card/user_leaderboard_card.dart';

import '../models/user.dart';

// ignore_for_file: must_be_immutable
class Leaderboard extends StatelessWidget {
  final ScrollController? scrollController;

  Leaderboard({Key? key, this.scrollController}) : super(key: key);

  late List<User> users;
  int page = 0;
  bool reachedEnd = false;

  final LeaderboardBloc lbBloc = sl<LeaderboardBloc>();
  late ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = scrollController ?? ScrollController();

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
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
    );
  }

  BlocProvider<LeaderboardBloc> _buildLeaderboard() {
    return BlocProvider(
      create: (_) => lbBloc..add(GetLeaderboardUsers()),
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoading) {
            return _buildNonLb(const CupertinoActivityIndicator());
          } else if (state is LeaderboardError) {
            return _buildNonLb(Text(state.message));
          } else if (state is LeaderboardLoaded) {
            users = state.users;

            return loadedListView(context);
          } else if (state is LeaderboardMoreLoaded) {
            users.addAll(state.users);

            if (state.users.length < 100) {
              reachedEnd = true;
            }
            
            return loadedListView(context);
          } else {
            return _buildNonLb(const CupertinoActivityIndicator());
          }
        },
      ),
    );
  }

  Widget _buildNonLb(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(child: child),
    );
  }

  Widget loadedListView(BuildContext context) {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;

        if (!isTop && !reachedEnd) {
          page = page + 1;
          lbBloc.add(GetMoreLeaderboardUsers(page));
        }
      }
    });

    return ListView.builder(
      controller: Utils.isMobile(context) ? null : _controller,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserLeaderboardCard(users.elementAt(index), index + 1);
      },
    );
  }
}
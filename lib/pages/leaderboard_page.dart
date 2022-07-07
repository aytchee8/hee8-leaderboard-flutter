import 'package:flutter/material.dart';

import 'package:hee8_lb/widgets/leaderboard.dart';
import 'package:hee8_lb/widgets/role_rewards.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc20000),
        centerTitle: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Image.asset("assets/h.gif", width: 40, height: 40),
            ),
            const Text("HEE8 Leaderboard")
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Leaderboard(),
            RoleRewards(),
          ],
        ),
      ),
    );
  }
}
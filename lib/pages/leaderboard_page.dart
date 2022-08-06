import 'package:flutter/material.dart';
import 'package:hee8_lb/utils/utils.dart';

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
            const Text("HEE8 Leaderboard !!!!!!!!!!!!!!!! THIS IS A TEST HI EMIR !!!!!!!!!!!!!!!!!")
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
        child: Utils.isMobile(context)
          ? _buildColumn()
          : _buildRow()
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Flexible(flex: 3, child: Leaderboard()),
        RoleRewards(),
      ],
    );
  }

  Widget _buildColumn() {
    final ScrollController controller = ScrollController();
    
    return ListView(
      shrinkWrap: true,
      controller: controller,
      physics: const BouncingScrollPhysics(),
      children: [
        const RoleRewards(),
        Leaderboard(scrollController: controller),
      ],
    );
  }
}

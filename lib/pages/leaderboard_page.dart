import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color(0xff21262B),
              ),
              height: 400,
              width: 300,
            ),
            Container(
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: Color(0xff21262B),
              ),
              height: 700,
              width: 900,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("Role Rewards")
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
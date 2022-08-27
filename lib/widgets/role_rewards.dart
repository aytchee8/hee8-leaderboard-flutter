import 'package:flutter/material.dart';

import 'package:hee8_lb/utils/constants.dart';
import 'package:hee8_lb/widgets/role_banner.dart';
import 'package:hee8_lb/widgets/user_card/user_card.dart';

class RoleRewards extends StatelessWidget {
  const RoleRewards({Key? key}) : super(key: key);

  final Color _bgColor = const Color(0xFF21252b);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _bgColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 1.0),
              blurRadius: 6.0,
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("ROLE REWARDS", style: TextStyle(fontFamily: kInter, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15)),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  verticalOffset: 30,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  message: "Send messaqes in the server to qain XP and receive roles!",
                  child: const Icon(Icons.help, size: 17, color: Colors.grey)
                )
              ],
            ),
            const SizedBox(height: 5),
            const RoleBanner(
              level: 10,
              name: "H Noble",
              color: Color(0xFF433bff),
            ),
            const RoleBanner(
              level: 20,
              name: "H Novice",
              details: "• Gift hcoins to friends",
              color: Color(0xFF6d59ff),
            ),
            const RoleBanner(
              level: 30,
              name: "H Pro",
              details: "• Access to the exclusive #hvip channel",
              color: Color(0xFF7d8bff),
            ),
            const RoleBanner(
              level: 40,
              name: "H Master",
              details: "• Set your own custom leaderboard banner",
              color: Color(0xFF7f8ed5),
            ),
            const RoleBanner(
              level: 50,
              name: "H Leqend",
              details: "• Get a custom role with the color, name, and icon of your choice",
              color: Color(0xFFfc09f5),
            ),
            const Divider(),
            const UserCard()
          ],
        ),
      ),
    );
  }
}
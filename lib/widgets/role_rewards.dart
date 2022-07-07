import 'package:flutter/material.dart';
import 'package:hee8_lb/widgets/role_banner.dart';

class RoleRewards extends StatelessWidget {
  const RoleRewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Color(0xff21262B),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(1.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      height: 400,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Role Rewards", style: TextStyle(fontSize: 20)),
            RoleBanner("H Noble (10)", Color(0xFF433BFF)),
            RoleBanner("H Novice (20)", Color(0xFF6D59FF)),
            RoleBanner("H Pro (30)", Color(0xFF7D8BFF)),
            RoleBanner("H Master (40)", Color(0xFF7F8ED5)),
            RoleBanner("H Leqend (50)", Color(0xFFFC09F5))
          ],
        ),
      )
    );
  }
}
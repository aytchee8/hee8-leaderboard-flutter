import 'package:flutter/material.dart';
import 'package:hee8_lb/utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserLeaderboardCardAvatar extends StatelessWidget {
  final String avatarUrl;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final int xp;
  final int level;

  const UserLeaderboardCardAvatar(
    this.avatarUrl,
    this.xp,
    this.level,
    {Key? key,
     this.width,
     this.height,
     this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 20, right: 20),
      child: CircularPercentIndicator(
        radius: 30,
        backgroundColor: const Color.fromARGB(255, 44, 49, 54),
        percent: Utils.calculatePercentage(xp, level),
        center: ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: Image.network(
            avatarUrl,
            height: height ?? 50,
            width: width ?? 50,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
      
              return defaultAvatar();
            },
            errorBuilder: (context, object, stackTrace) {
              return defaultAvatar();
            },
          )
        ),
      )
    );
  }

  Widget defaultAvatar() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: const Color(0xffC4C4C4),
      ),
      alignment: Alignment.center,
    );
  }
}
import 'package:flutter/material.dart';

class UserLeaderboardCardAvatar extends StatelessWidget {
  final String avatarUrl;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const UserLeaderboardCardAvatar(this.avatarUrl, {Key? key, this.width, this.height, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 20, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(99),
        child: Image.network(
          avatarUrl,
          height: height ?? 60,
          width: width ?? 60,
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
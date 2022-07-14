import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final Function() onPressed;

  const LogoutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 17,
      padding: const EdgeInsets.only(left: 5),
      tooltip: "Log out",
      color: Colors.red,
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: const Icon(Icons.logout)
    );
  }
}
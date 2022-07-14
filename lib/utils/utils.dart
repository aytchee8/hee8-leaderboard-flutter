import 'package:flutter/material.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }
}
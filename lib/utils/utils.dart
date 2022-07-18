import 'dart:math' as math;

import 'package:flutter/material.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static double calculatePercentage(int xp, int level) {
    var xpForNextLevel = 5 * math.pow(level, 2) + 50 * level + 100;

    double xpForPreviousLevels = 100;
    for (var i = 0; i < level; i++) {
      xpForPreviousLevels += ((level - i - 1) / 2) * (55 + (level - i - 2) * 10 + 55) + 100;
    }
    double currentXpInLevel = xp - xpForPreviousLevels;

    return (currentXpInLevel / xpForNextLevel);
  }
}
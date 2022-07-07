import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hee8_lb/pages/leaderboard_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HEE8 Leaderboard",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)
        )
      ),
      home: const LeaderboardPage(),
    );
  }
}

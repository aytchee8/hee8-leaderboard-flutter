import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:hee8_lb/pages/leaderboard_page.dart';
import 'package:hee8_lb/utils/constants.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

  await ic.init();
  await dotenv.load(fileName: ".env");

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
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: kHindSiliguri, fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)
        ),
      ),
      home: const LeaderboardPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_training/session_1/main_page.dart';
import 'package:flutter_training/session_3/starting_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'splash_page': (context) => const StartingScreen(),
        'weather_page': (context) => const MainRPage(),
        },
      initialRoute: 'splash_page',
    );
  }
}

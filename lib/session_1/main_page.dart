import 'package:flutter/material.dart';
import 'package:flutter_training/session_1/weather_screen.dart';

class MainRPage extends StatelessWidget {
  const MainRPage({super.key});

  Widget buildView() {
    return const Scaffold(body: WeatherScreen());
  }

  @override
  Widget build(BuildContext context) {
    return buildView();
  }
}

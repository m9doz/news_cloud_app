import 'package:flutter/material.dart';
import 'package:news_app_t/screens/home_screen.dart';

void main() {
  runApp(news_app());
}

class news_app extends StatelessWidget {
  const news_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

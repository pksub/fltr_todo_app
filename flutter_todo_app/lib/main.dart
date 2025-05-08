import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/home_screen.dart';

void main() {
  // debugPaintSizeEnabled = true; //디버그 디자인 위젯 경계 시각화
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
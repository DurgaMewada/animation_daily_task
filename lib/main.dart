import 'package:animation_daily_task/task1.dart';
import 'package:animation_daily_task/task2.dart';
import 'package:animation_daily_task/task3/page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeroWidget(),
    );
  }
}

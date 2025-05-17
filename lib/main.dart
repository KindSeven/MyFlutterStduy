import 'package:flutter/material.dart';
import 'counter/counter_page.dart';
import 'guess/guess_page.dart';
import 'muyu/muyupage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 计数器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MuyuPage(),
    );
  }
}


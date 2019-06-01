import 'package:flutter/material.dart';
import 'package:flutter_hackathon/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: 'Flutter Gallery',
      home: HomePage(),
    );
  }
}

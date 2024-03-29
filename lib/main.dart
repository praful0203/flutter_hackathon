import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: 'Buy Tickets',
      home: HomeWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}

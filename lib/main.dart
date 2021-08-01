import 'package:flutter/material.dart';
import 'package:moviebrowserflutter/trending.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Browser',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        body: TrendingPage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

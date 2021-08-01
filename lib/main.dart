import 'package:flutter/material.dart';
import 'package:moviebrowserflutter/route_generator.dart';
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
          textTheme: TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      )),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF222222),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.all(10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/search');
              },
            ),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              child: Icon(Icons.person),
              padding: EdgeInsets.only(right: 5),
            ),
          ],
          backgroundColor: Colors.black,
        ),
        body:
            Container(padding: EdgeInsets.only(top: 10), child: TrendingPage()),
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black38,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Browse'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Stream list'),
          ],
        ),
      ),
    );
  }
}

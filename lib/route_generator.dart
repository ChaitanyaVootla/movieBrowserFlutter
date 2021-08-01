import 'package:flutter/material.dart';
import 'package:moviebrowserflutter/trending.dart';
import 'package:moviebrowserflutter/components/search.dart';
import 'components/movie.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => TrendingPage());
      case '/search':
        return MaterialPageRoute(
          builder: (_) => Search(),
        );
      case '/movie':
        return MaterialPageRoute(
          builder: (_) => Movie(id: args['id']),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
        ),
        body: Center(
          child: Text('404'),
        ),
      );
    });
  }
}

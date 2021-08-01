import 'package:flutter/material.dart';
import 'package:moviebrowserflutter/api/tmdb.dart';
import 'package:moviebrowserflutter/components/common/carousel.dart';
import 'package:moviebrowserflutter/components/common/scroller.dart';

class TrendingPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TrendingPage> {
  List trendingWeek = [];
  List trendingSeries = [];
  List allTrending = [];
  bool isLoading = true;

  @override
  void initState() {
    _initializeApp();

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Text('loading')
          : ListView(
              children: [
                Container(
                  child: Carousel(
                    items: allTrending,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Scroller(
                    itemsList: trendingWeek,
                    heading: 'Trending Movies',
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Scroller(
                    itemsList: trendingSeries,
                    heading: 'Trending Series',
                  ),
                ),
              ],
            ),
    );
  }

  void _initializeApp() async {
    final trendingWeekRes = await getTrendingMovies();
    final trendingSeriesRes = await getTrendingSeries();
    final trendingAllRes = await getTrendingAll();
    setState(() {
      trendingWeek = trendingWeekRes;
      trendingSeries = trendingSeriesRes;
      allTrending = trendingAllRes;
      isLoading = false;
    });
  }
}

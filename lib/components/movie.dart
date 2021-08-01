import 'package:flutter/material.dart';
import 'package:moviebrowserflutter/api/tmdb.dart';
import 'package:moviebrowserflutter/components/common/scroller.dart';

class Movie extends StatefulWidget {
  final int id;

  const Movie({Key? key, required this.id}) : super(key: key);
  MovieState createState() => MovieState();
}

class MovieState extends State<Movie> {
  dynamic movie = {};
  bool isLoading = true;
  @override
  void initState() {
    _initializeState();

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: isLoading
              ? Text('loading')
              : ListView(
                  children: [
                    Stack(
                      children: [
                        Opacity(
                          opacity: 0.75,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w1280/' +
                                movie['backdrop_path'],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            movie['title'],
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Scroller(
                        itemsList: movie['credits']['cast'],
                        heading: 'Cast',
                        height: 130,
                        type: 'person',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Scroller(
                        itemsList: movie['credits']['crew'],
                        heading: 'Crew',
                        height: 130,
                        type: 'person',
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  void _initializeState() async {
    final movieRes = await getMovie(widget.id);
    isLoading = false;
    setState(() {
      movie = movieRes;
    });
  }
}

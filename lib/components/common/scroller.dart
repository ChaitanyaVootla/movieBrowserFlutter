import 'package:flutter/material.dart';

class Scroller extends StatefulWidget {
  final List itemsList;
  final String heading;
  Scroller({required this.itemsList, required this.heading});
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Scroller> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.heading,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w185/' +
                        widget.itemsList[index]['poster_path'],
                  ),
                ),
              ),
              addAutomaticKeepAlives: false,
            ),
          ),
        ],
      ),
    );
  }
}

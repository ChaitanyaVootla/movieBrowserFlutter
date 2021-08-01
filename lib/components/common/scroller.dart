import 'package:flutter/material.dart';

class Scroller extends StatefulWidget {
  final List itemsList;
  final String heading;
  double height;
  final String type;
  Scroller({
    required this.itemsList,
    required this.heading,
    this.height = 200,
    this.type = 'movie',
  });
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
            height:
                widget.type == 'person' ? widget.height + 50 : widget.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/movie',
                        arguments: {'id': widget.itemsList[index]['id']});
                  },
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Image.network(
                              (widget.itemsList[index]?['poster_path'] ??
                                              widget.itemsList[index]
                                                  ?['profile_path'] ??
                                              '')
                                          .length >
                                      0
                                  ? 'https://image.tmdb.org/t/p/w185/' +
                                      (widget.itemsList[index]
                                              ?['poster_path'] ??
                                          widget.itemsList[index]
                                              ?['profile_path'])
                                  : '',
                              errorBuilder: (context, object, stackTrace) {
                                return Center(child: Text('404'));
                              },
                              height: widget.height,
                            ),
                          ),
                          Offstage(
                            offstage: widget.type != 'person',
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              width: 85,
                              child: Text(
                                widget.itemsList[index]['name'] ?? '',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Offstage(
                            offstage: widget.type != 'person',
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 85,
                                child: Text(
                                  widget.itemsList[index]['character'] ??
                                      widget.itemsList[index]
                                          ['known_for_department'] ??
                                      '',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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

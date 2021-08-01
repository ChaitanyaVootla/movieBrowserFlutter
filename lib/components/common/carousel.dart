import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  final List items;
  const Carousel({Key? key, required this.items}) : super(key: key);
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: CarouselSlider.builder(
          itemCount: widget.items.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ListView(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w1280/' +
                              widget.items[itemIndex]['backdrop_path'],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.items[itemIndex]['title'] ??
                              widget.items[itemIndex]['name'],
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        padding: EdgeInsets.all(5),
                      )
                    ],
                  ),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 6),
            enlargeCenterPage: true,
          )),
    );
  }
}

import 'package:flutter/material.dart';

final appBar = AppBar(
  title: Container(
      child: TextField(
    decoration: InputDecoration(
      fillColor: Colors.grey,
    ),
  )),
  actions: [
    Container(alignment: Alignment.center, child: Text('login')),
  ],
  backgroundColor: Colors.black,
);

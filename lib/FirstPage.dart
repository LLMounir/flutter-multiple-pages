import 'dart:convert';
import 'package:flutter/material.dart';
import 'json_page.dart';
import 'package:http/http.dart' as http;

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
      child: new Column(
        children: <Widget>[
          new Icon(Icons.accessibility_new, size: 155.0, color: Colors.brown),
          new IconButton(
              icon:
                  new Icon(Icons.sentiment_satisfied, color: Colors.blueAccent),
              iconSize: 150.0,
              onPressed: () {
                func();
              })
        ],
      ),
    ));
  }
}

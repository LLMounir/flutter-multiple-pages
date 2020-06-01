import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;
import './loader.dart'; 
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    //home: new MyTextInput(),
    routes: <String, WidgetBuilder>{
      "/SecondPage": (BuildContext context) => new SecondPage(),
      "/TextInputPage": (BuildContext context) => new MyTextInput(),
      "/MyTabs": (BuildContext context) => new MyTabs(),
      "/MyHTTP": (BuildContext context) => new MyHTTP()
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Home"), backgroundColor: Colors.deepOrange),
      body: new Container(
          child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new IconButton(
                icon: new Icon(Icons.sentiment_satisfied,
                    color: Colors.blueAccent),
                iconSize: 150.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SecondPage()));
                }),
            new Text("Go to second page"),
            new IconButton(
                icon: new Icon(Icons.text_fields, color: Colors.lightGreen),
                iconSize: 150.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyTextInput()));
                }),
            new Text("Go to text field page"),
            new IconButton(
                icon: new Icon(Icons.local_pizza, color: Colors.teal),
                iconSize: 150.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyTabs()));
                }),
            new Text("Go to 'I love Pizza'"),
            new IconButton(
                icon: new Icon(Icons.http, color: Colors.black),
                iconSize: 150.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyHTTP()));
                }),
            new Text("Go to HTTP Page")
          ],
        ),
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Second Page"), backgroundColor: Colors.blueAccent),
      body: new Container(
          child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home, color: Colors.deepOrange),
                iconSize: 170.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomePage()));
                }),
            new Text("Go to HomePage"),
            new Spacer(),
            new Loader(),
            new Spacer()
          ],
        ),
      )),
    );
  }
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => new MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  final TextEditingController controller = new TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Input Text"),
          backgroundColor: Colors.lightGreen,
        ),
        body: new Container(
            child: new Center(
                child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(hintText: "Type in here"),
              onSubmitted: (String str) {
                setState(() {
                  result = result + "\n" + str;
                  controller.text = "";
                });
              },
              controller: controller,
            ),
            new Text(result)
          ],
        ))));
  }
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tabs"),
        backgroundColor: Colors.teal,
        bottom: new TabBar(controller: controller, tabs: <Tab>[
          new Tab(icon: new Icon(Icons.arrow_forward)),
          new Tab(icon: new Icon(Icons.arrow_downward)),
          new Tab(icon: new Icon(Icons.arrow_back))
        ]),
      ),
      bottomNavigationBar: new Material(
          color: Colors.teal,
          child: new TabBar(controller: controller, tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back))
          ])),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ],
      ),
    );
  }
}

class MyHTTP extends StatefulWidget {
  @override
  MyHTTPState createState() => new MyHTTPState();
}

class MyHTTPState extends State<MyHTTP> {
  Future<String> getData() async {
    http.Response response =
        await http.get('http://jsonplaceholder.typicode.com/posts');

    List data = jsonDecode(response.body);
    print(data[1]["title"]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HTTP'),
        backgroundColor: Colors.black,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: getData,
          child: new Text("Get Data"),
        ),
      ),
    );
  }
}

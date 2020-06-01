import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  State createState() => LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: new Duration(milliseconds: 800), vsync: this);
    animation = new CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            height: 3.0,
            width: animation.value * 200,
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
          Container(
            color: Colors.deepOrange,
            height: 3.0,
            width: animation.value * 125,
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
          Container(
            color: Colors.deepOrange,
            height: 3.0,
            width: animation.value * 50,
          )
        ]);
  }
}

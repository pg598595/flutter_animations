import 'dart:async';

import 'package:book_tickets/select_locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double _ironManAlignment = -500;
  AnimationController _controller;
  bool animated = false;
  bool colapse = false;
  bool displayButtons = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () => _flyIronMan());
    Timer(Duration(seconds: 4), () => showButtons);
    Timer(Duration(seconds: 4), () => _controller.stop());
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/mars.png',
            scale: 0.5,
            color: Colors.transparent,
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 3),
            bottom: _ironManAlignment,
            child: Hero(
              tag: 'MarsImage',
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      child: Image.asset(
                        'assets/images/mars.png',
                        scale: 0.5,
                      ),
                    ),
                    builder: (BuildContext context, Widget child) {
                      return Transform.rotate(
                        angle: _controller.value * 1,
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              children: [
                FadeIn(
                  child: Column(
                    children: [
                      buildAnimatedDefaultTextStyle("M"),
                      buildAnimatedDefaultTextStyle("A"),
                      buildAnimatedDefaultTextStyle("R"),
                      buildAnimatedDefaultTextStyle("S"),
                    ],
                  ),
                  // Optional paramaters
                  duration: Duration(seconds: 3),
                  curve: Curves.easeIn,
                ),
              ],
            ),
          ),
          colapse?
              SizedBox():
          Padding(
            padding: const EdgeInsets.only(top: 650.0),
            child: FadeIn(
                duration: Duration(seconds: 5),
                child: Align(
                    alignment: Alignment.bottomCenter, child: buildBottons())),
          ),
        ],
      ),
    );
  }

  FadeIn buildBottons() {
    return FadeIn(
      child: Column(
        children: [
          FlatButton(
            shape:
                RoundedRectangleBorder(side: BorderSide(color: Colors.white)),
            color: Colors.transparent,
            textColor: Colors.white,
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
            onPressed: () {},
            child: Text(
              "   More Info.  ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          FlatButton(
            shape:
                RoundedRectangleBorder(side: BorderSide(color: Colors.white)),
            color: Colors.white,
            textColor: Colors.white,
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
            onPressed: () {
              setState(() {
                colapse = true;
              });
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 3000),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return SelectLocations();
                  },
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            },
            child: Text(
              "Book Tickets",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      // Optional paramaters
      duration: Duration(seconds: 5),
      curve: Curves.easeIn,
    );
  }

  Widget buildAnimatedDefaultTextStyle(String text) {
    return AnimatedDefaultTextStyle(
      style: colapse
          ? TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            )
          : animated
              ? TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                )
              : TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 120,
                ),
      curve: Curves.easeIn,
      duration: Duration(seconds: 3),
      child: Text(
        text,
      ),
    );
  }

  void _flyIronMan() {
    setState(() {
      _ironManAlignment = -150;
      animated = !animated;
    });
  }

  void showButtons() {
    setState(() {
      displayButtons = true;
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

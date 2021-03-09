import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSeatsScreen extends StatefulWidget {
  @override
  _BookSeatsScreenState createState() => _BookSeatsScreenState();
}

class _BookSeatsScreenState extends State<BookSeatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Animator(
          duration: Duration(seconds: 2),
          cycles: 0,
          repeats: 1,
          builder: (context, anim, child ) => Transform.scale(
              scale: anim.value,
              child: Image.asset(
                "assets/images/plane.png",
                color: Colors.white,
                scale: 0.5,
                fit: BoxFit.fill,
              ))),
    );
  }
}

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
      child: Container(
        child: Icon(Icons.airplanemode_on_sharp,color: Colors.white,size: 50,),
      ),
    );
  }
}

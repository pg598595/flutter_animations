import 'dart:async';

import 'package:animator/animator.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custoum_dialog_box.dart';
import 'model/seat_details.dart';

class BookSeatsScreen extends StatefulWidget {
  @override
  _BookSeatsScreenState createState() => _BookSeatsScreenState();
}

class _BookSeatsScreenState extends State<BookSeatsScreen>
    with TickerProviderStateMixin {
  double _ironManAlignment = -250;
  AnimationController _controller;
  bool animated = false;
  bool colapse = false;
  bool displayButtons = false;
  bool displaySeats = false;
  int planeSize = 2500;
  final scrollController = ScrollController();
  var detailsList = List<SeatDetails>();

  @override
  void initState() {
    super.initState();
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 1));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: false, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 3));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 4));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 5));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 6));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 7));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 8));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 9));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 10));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 1));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: false, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 3));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 4));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 5));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 6));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 7));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 8));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 9));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 10));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 9));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 10));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: false, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 2", isBooked: null, id: 2));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    detailsList.add(SeatDetails(name: "Seat 1", isBooked: true, id: 11));
    Timer(Duration(seconds: 1), () => _flyIronMan());
    Timer(Duration(seconds: 2), () => _stopAnimation());
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            bottom: _ironManAlignment,
            child: Hero(
              tag: 'MarsImage',
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    child: Animator(
                      duration: Duration(seconds: 2),
                      cycles: 0,
                      repeats: 1,
                      builder: (context, anim, child) => Container(
                        width: planeSize * anim.value,
                        height: planeSize * anim.value,
                        child: Image.asset(
                          'assets/images/plane.png',
                          color: Colors.white,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    builder: (BuildContext context, Widget child) {
                      return Transform.rotate(
                        angle: 0,
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          displaySeats
              ? Padding(
                  padding: const EdgeInsets.only(left: 45.0, right: 45.0),
                  child: SizedBox(
                    height: 260,
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: <Widget>[
                        LiveSliverGrid(
                          showItemInterval: Duration(microseconds: 2500),
                          controller: scrollController,
                          itemCount: detailsList.length,
                          itemBuilder: buildAnimatedItem,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: InkWell(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "Custom Dialog Demo",
                      descriptions:
                          "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                      text: "Yes",
                      onClick: onClickOK,
                    );
                  });
            },
            child: Icon(
              Icons.event_seat,
              color: detailsList[index].isBooked == null
                  ? Colors.transparent
                  : detailsList[index].isBooked
                      ? Colors.white
                      : Colors.white38,
              size: 50,
            ),
          ),
        ),
      );

  void _flyIronMan() {
    setState(() {
      _ironManAlignment = -600;
      animated = !animated;
    });
  }

  void _stopAnimation() {
    _controller.stop();
    setState(() {
      displaySeats = true;
    });
  }

  void onClickOK() {
    Navigator.pop(context);
    setState(() {
      planeSize = 400;
      _ironManAlignment = 1000;
      displaySeats = false;
    });
    _controller.reverse();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

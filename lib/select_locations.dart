import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:book_tickets/model/loactionDeatils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'location_details.dart';

class SelectLocations extends StatefulWidget {
  @override
  _SelectLocationsState createState() => _SelectLocationsState();
}

class _SelectLocationsState extends State<SelectLocations> {
  static List<List<Offset>> points = [
    [
      Offset(178, 152),
      Offset(148, 179),
      Offset(245, 186),
      Offset(245, 186),
    ],
    [
      Offset(250, 320),
      Offset(348, 220),
      Offset(345, 286),
      Offset(345, 286),
    ]
  ];
  final listShowItemDuration = Duration(milliseconds: 250);

  final scrollController = ScrollController();
  final options = LiveOptions(
    delay: Duration(seconds: 1),
    showItemInterval: Duration(milliseconds: 500),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );
  final List<Path> polygonRegions = points.map((e) {
    Path p = Path();
    p.addPolygon(e, true);
    return p;
  }).toList();
  final List<Color> colors =
      List.generate(points.length, (index) => Color.fromRGBO(50, 50, 200, 0.5));
  var locationList = List<LocationDetails>();

  @override
  void initState() {
    locationList.add(
        LocationDetails(name: "asdas", distance: "35 m", id: 1, image: ""));
    locationList
        .add(LocationDetails(name: "ttrt", distance: "40 m", id: 2, image: ""));
    locationList.add(
        LocationDetails(name: "asdcvcvas", distance: "25 m", id: 3, image: ""));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FadeIn(
            duration: Duration(seconds: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 50.0),
              child: Row(
                children: [
                  TyperAnimatedTextKit(
                    speed: Duration(microseconds: 500),
                    repeatForever: false,
                    totalRepeatCount: 1,
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Where do you \nwant to go?",
                    ],
                    textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                    tag: 'MarsImage',
                    child: Image.asset(
                      'assets/images/mars.png',
                      scale: 0.5,
                    ),
                  ),
                  Hero(
                      tag: 'PinLocation',
                      child: Positioned(
                          top: 100, left: 140, child: buildPinIcon())),
                  Positioned(top: 200, left: 160, child: buildPinIcon()),
                  Positioned(top: 180, left: 300, child: buildPinIcon()),
                  Positioned(top: 250, left: 200, child: buildPinIcon()),
                  Positioned(top: 80, left: 250, child: buildPinIcon()),

                  // ImageMap(
                  //     imagePath: 'assets/images/transparentImage.png',
                  //     imageSize: Size(700, 700),
                  //     onTap: (i) {
                  //       colors[i] = colors[i] == Color.fromRGBO(50, 50, 200, 0.5)
                  //           ? Color.fromRGBO(50, 200, 50, 0.5)
                  //           : Color.fromRGBO(50, 50, 200, 0.5);
                  //       print(i);
                  //       setState(() {});
                  //     },
                  //     regions: polygonRegions,
                  //     regionColors: colors)
                ],
              ),
            ),
          ),
          FadeIn(
            duration: Duration(seconds: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: locationList.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 1000),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return LocationDetailsScreen();
                          },
                          maintainState: true,
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return Align(
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Zone ${locationList[index].id}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 35.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  locationList[index].distance,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPinIcon() {
    return Icon(
      Icons.location_pin,
      color: Colors.white,
    );
  }
}

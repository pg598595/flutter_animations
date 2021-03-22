import 'package:auto_animated/auto_animated.dart';
import 'package:book_tickets/model/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_seats.dart';

class LocationDetailsScreen extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetailsScreen> {
  var imagesList = List<String>();
  var detailsList = List<Details>();

  final options = LiveOptions(
    delay: Duration(microseconds: 500),
    showItemInterval: Duration(milliseconds: 300),
    showItemDuration: Duration(microseconds: 500),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );
  final scrollController = ScrollController();
  final int listItemCount = 4;
  final listShowItemDuration = Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    imagesList.add("assets/images/image1.jpeg");
    imagesList.add("assets/images/images2.jpeg");
    imagesList.add("assets/images/image3.jpeg");
    imagesList.add("assets/images/images4.jpeg");
    imagesList.add("assets/images/images5.jpeg");
    detailsList.add(Details(title: "Degrees", value: "-63" + "\u00B0"));
    detailsList.add(Details(title: "Ration Km", value: "3.389"));
    detailsList.add(Details(title: "Dist Mil. km", value: "225"));
    detailsList.add(Details(title: "Lorem", value: "345"));
    detailsList.add(Details(title: "Ipsum", value: "1.245"));
    detailsList.add(Details(title: "Hi Mam", value: "54"));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'PinLocation',
            child: Image.asset(
              "assets/images/surface2.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          SingleChildScrollView(
            primary: false,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0, left: 15.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0, left: 15.0),
                      child: Text(
                        "Zone 1 \nHolden Carter",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 220.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0, left: 15.0),
                        child: Row(
                          children: [
                            Text(
                              "Pictures",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 15.0, right: 15.0),
                        child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: imagesList.length,
                                itemBuilder:
                                    (BuildContext context, int index) => Card(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        color: Colors.transparent,
                                        child: Image.asset(
                                          imagesList[index],
                                          width: 150,
                                          fit: BoxFit.fitHeight,
                                        )))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 15.0),
                        child: Row(
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15.0, right: 15.0),
                        child: Row(
                          children: [
                            Text(
                              "Violent impacts and fluid flows blasted and carved "
                              "\nHolden Crater. Scientists have flagged the old impact "
                              "\ncrater as a place that could have had habitable "
                              "\nconditions for microbial life. Minerals here formed "
                              "\nin a body of water the size of Lake Huron. At some "
                              "\npoint, the rim of the water-swollen crater gave way, "
                              "\nprobably during a great flood. Water flowing out "
                              "\nof the broken crater rim swept away layers of "
                              "\nsediment and revealed even older clay sediments "
                              "\nfrom another, earlier lakebed. That older lake could "
                              "\nhave existed for thousands of years, long enough for "
                              "\nmicrobial life to take hold. The clays have the potential "
                              "\nto preserve signs of life.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 260,
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers: <Widget>[
                              LiveSliverGrid(
                                controller: scrollController,
                                itemCount: detailsList.length,
                                itemBuilder: buildAnimatedItem,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white)),
                        color: Colors.white,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 50.0, left: 50.0),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 100),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return BookSeatsScreen();
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
                          "Book Seats Now",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
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
          child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          detailsList[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(detailsList[index].value,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0)),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      );
}

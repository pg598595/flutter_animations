import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDetailsScreen extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetailsScreen> {
  var imagesList = List<String>();

  @override
  void initState() {
    super.initState();
    imagesList.add(
        "https://upload.wikimedia.org/wikipedia/commons/d/dc/PIA17944-MarsCuriosityRover-AfterCrossingDingoGapSanddune-20140209.jpg");
    imagesList.add(
        "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/pia21044_orig.jpg");
    imagesList.add(
        "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/pia21716.jpg");
    imagesList.add(
        "https://upload.wikimedia.org/wikipedia/commons/d/dc/PIA17944-MarsCuriosityRover-AfterCrossingDingoGapSanddune-20140209.jpg");
    imagesList.add(
        "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/pia21044_orig.jpg");
    imagesList.add(
        "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/pia21716.jpg");
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
                        height: 250.0,
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
                                        child: Image.network(
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
}

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(3.3, 3.3, 3.3, 0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(3.3, 3.3, 3.3, 0),
                // margin:
                //     const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius`
                height: size.height * 0.77,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.height * 0.02),
                  child: Image.asset(
                    'images/profile_woman_images/shudipto-sarker-9yuSC_3gUDU-unsplash.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Ink(
                  height: size.height * 0.08,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 1.0,
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(
                      LineAwesomeIcons.times,
                      color: Color(0xFFFE3C72),
                      size: size.height * 0.05,
                    ),
                  ),
                ),
                Ink(
                  height: size.height * 0.07,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 1.0,
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(
                      LineAwesomeIcons.star_1,
                      color: Color(0xFF0091EA),
                      size: size.height * 0.04,
                    ),
                  ),
                ),
                Ink(
                  height: size.height * 0.08,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 1.0,
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(
                      LineAwesomeIcons.heart_1,
                      color: Color(0xFF84F0D5),
                      size: size.height * 0.045,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

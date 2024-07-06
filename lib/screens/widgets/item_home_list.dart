import 'package:flutter/material.dart';

import '../../ImageCon.dart';
import '../../colors.dart';
import '../../constants.dart';
import '../../strings.dart';
import '../detail_screen.dart';
import 'read_more_text.dart';

class ItemHomeList extends StatelessWidget {
  const ItemHomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
              colors: [Color(0xffbcc8db), Color(0xffD2DBEA)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            CustomShapeImage(imgDetail),
            //Image.asset("assets/images/img_home_detail.png"),
            SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  details,
                  style: kTextField,
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
              child: TwoLineTextWithReadMore(
                text:
                    "Thailand, one of asia's most popular travel destination, has been badly git a pandemic-include tourism slump, with about 200,00 arrival at last yesterday.",
                maxLines: 3, // dynamic maxLines
                readMoreColor:
                    Colors.black, // dynamic color for "Read More" label
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomShapeImage(String imagePath) {
  return Center(
    child: Stack(
      children: [
        // Background container with rounded corners and image
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlay container at the bottom-right corner
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: kColorButtonBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Center(
              child: Text(
                '80%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

import '../ImageCon.dart';
import '../colors.dart';
import '../constants.dart';
import '../strings.dart';
import 'widgets/action_bar_home.dart';
import 'widgets/item_home_list.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> items = ["1", "2", "3", "4"];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScreenBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36),
            // Placeholder for ActionBarHome. Replace with your actual widget.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(child: ActionBarHome()),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  autocorrect: false,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      imgSearch,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: "Location",
                    hintStyle: kTextField,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        imgFilter,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  readOnly: true,
                  cursorColor: Colors.black,
                  autocorrect: false,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(imgCalender,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: "July 08 - July 15",
                    hintStyle: kTextField,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextField(
                        cursorColor: Colors.black,
                        autocorrect: false,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            imgPeopleAt,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "2 Guests",
                          hintStyle: kTextField,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Image.asset(imgAdd)
                          ),
                          Image.asset(imgDivider),
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Image.asset(imgRemove)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kColorButtonBg,
                  boxShadow: [
                    BoxShadow(
                      color: kColorButtonBg.withOpacity(0.5),
                      blurRadius: 7.0,
                      spreadRadius: 2,
                      offset: Offset(0, 0),),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: Text(
                    search,
                    style: kTextFieldWhite,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(items.length, (index) {
                return const ItemHomeList();
              }),
            )
          ],
        ),
      ),
    );
  }
}

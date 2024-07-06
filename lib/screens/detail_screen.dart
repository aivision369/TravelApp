import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/item_detail_model.dart';
import 'package:travel_app/screens/widgets/read_more_text.dart';

import '../ImageCon.dart';
import '../colors.dart';
import '../constants.dart';
import 'widgets/photo_grid.dart';

class DetailScreen extends StatefulWidget {
  static String routeName = "/DetailScreen";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update the state when the tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgTopBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 10,
                      right: 10, // Adjust the right padding as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Image.asset(imgBack,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          IconButton(
                            icon: Image.asset(imgShare,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset(imgLike,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'BALLI',
                            style: GoogleFonts.exo(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Indonesia',
                              style: GoogleFonts.exo(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 3, bottom: 3),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "4.9",
                                    style: GoogleFonts.exo(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Image.asset(imgStar)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.50 -
                  (MediaQuery.of(context).size.height * 0.20),
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65 +
                      (MediaQuery.of(context).size.height * 0.10),
                  color: kColorScreenBg,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 48.0,
                        child: TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // Creates rounded corners
                            color: Colors
                                .transparent, // Transparent to use custom background
                          ),
                          tabs: ItemDetailModel.detailList
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            String tabName = entry.value.tabName;
                            bool isSelected = _tabController.index == index;
                            return Tab(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // Creates rounded corners
                                  color: isSelected
                                      ? kColorUnSelButtonBg
                                      : Colors
                                          .white, // Background color for tabs
                                ),
                                child: Text(tabName,
                                    style: kTextField,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: ItemDetailModel.detailList
                              .map((tabItem) => Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: PhotoGrid(
                                            description: tabItem.description,
                                            imageUrls: tabItem.imageList,
                                            onExpandClicked: () =>
                                                print("onExpandClicked"),
                                            onImageClicked: (index) {},
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Detail".toUpperCase(),
                                          style: GoogleFonts.exo(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        TwoLineTextWithReadMore(
                                          text: tabItem.description,
                                          maxLines: 3,
                                          readMoreColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: kColorButtonBg,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: kColorButtonBg.withOpacity(0.5),
                                                  blurRadius: 7.0,
                                                  spreadRadius: 2,
                                                  offset: Offset(0, 0),),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(horizontal: 15.0,vertical: 9.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Continue",
                                                    style: GoogleFonts.exo(
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  //Image.asset("assets/images/ic_back.png"),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

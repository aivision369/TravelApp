import 'package:flutter/material.dart';

import 'ImageCon.dart';
import 'colors.dart';
import 'screens/detail_screen.dart';
import 'screens/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = "/DashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late final List<Widget> menuList;

  @override
  void initState() {
    super.initState();
    menuList = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorScreenBg,
        body: Stack(
          children: [
            Center(
              child: menuList.elementAt(_selectedIndex),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgBottomBG),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: IconButton(
                          iconSize: 50,
                          icon: Image.asset(
                            imgMenuHome,
                            color: _selectedIndex == 0
                                ? const Color(0xff18C0C1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            _onItemTapped(0);
                          },
                        ),
                      ),
                      IconButton(
                        // this button is hidden and set into center
                        iconSize: 50,
                        icon: Image.asset(imgMenuAction,
                          color: Colors.transparent,
                        ),
                        onPressed: () {},
                      ),
                      //_buildIcon(2,'assets/images/ic_menu_profile.png')
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 2
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: IconButton(
                          iconSize: 50,
                          icon: Image.asset(imgMenuProfile,
                            color: _selectedIndex == 2
                                ? const Color(0xff18C0C1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            _onItemTapped(2);
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 55,
              bottom: 10,
              child: IconButton(
                iconSize: 100,
                icon: Image.asset(imgMenuAction,),
                onPressed: () {
                  //_onItemTapped(1);
                },
              ),
            ),
          ],
        ));
  }
}

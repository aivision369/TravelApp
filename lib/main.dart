import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/strings.dart';

import 'colors.dart';
import 'dashboard_screen.dart';
import 'screens/home_screen.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: DashboardScreen.routeName,
      //home: const DashboardScreen(),
      routes: routePages,
    );
  }
}
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'screens/detail_screen.dart';

final routePages = <String, WidgetBuilder>{
  DetailScreen.routeName: (context) => const DetailScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen()
};

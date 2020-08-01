import 'package:bloc_library_sample/home/tabbar.dart';
import 'package:flutter/material.dart';

import 'item_list_view.dart';

class AppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          primaryColor: Color(0xFFFFFFFF),
          primarySwatch: Colors.red,
          tabBarTheme: TabBarTheme(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black45),
          textTheme: TextTheme(
              headline5: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
              subtitle2: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
              subtitle1: TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                  fontWeight: FontWeight.w600))),
      home: HomeTabs(),
    );
  }
}

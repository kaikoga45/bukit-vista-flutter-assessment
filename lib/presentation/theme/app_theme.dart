import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  primaryColor: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: Colors.blue, size: 30),
    unselectedIconTheme: IconThemeData(color: Color(0xFFDEDEDE), size: 30),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  tabBarTheme: const TabBarTheme(
      labelColor: Colors.blue, unselectedLabelColor: Colors.black26),
);

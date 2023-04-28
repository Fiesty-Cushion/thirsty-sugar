import 'package:attendy/features/routine/view/routine_view.dart';
import 'package:attendy/features/settings/view/profile_view.dart';
import 'package:flutter/material.dart';

class UIConstants {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const List<Widget> bottomTabBarPages = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    RoutineView(),
    Text(
      'Search',
      style: optionStyle,
    ),
    ProfileView(),
  ];
}

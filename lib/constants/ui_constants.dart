import 'package:attendy/features/settings/view/profile.dart';
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
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    ProfileView(),
  ];
}

import 'package:bookmarker1/Menu/menu_model.dart';
import 'package:flutter/material.dart';

class MenuItem {
  static const List<MenuModel> itemFirst = [
    itemSettings,
    itemShare,
  ];

  static const List<MenuModel> itemSecond = [itemSignOut];

  static const itemSettings = MenuModel('Settings', Icons.settings);
  static const itemShare = MenuModel('Share', Icons.share);
  static const itemSignOut = MenuModel('Sign Out', Icons.logout);
}

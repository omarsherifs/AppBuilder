import 'dart:convert';

import 'package:appbuilder/Features/Home/data/models/MenuItem.dart';
import 'package:flutter/material.dart';

class Config extends ChangeNotifier {
  static Map<String, dynamic> appConfig;
  static List<MenuItems> menuItems = [];
}

import 'dart:convert';

import 'package:appbuilder/Common/Network/Network.dart';
import 'package:appbuilder/Common/config/config.dart';
import 'package:appbuilder/Common/theme/appTheme.dart';
import 'package:appbuilder/Features/Home/data/models/MenuItem.dart';
import 'package:appbuilder/Features/Home/presentaion/pages/HomePage.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Common/utils/helpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(ProviderScope(child: MyApp()));
}

loadConfig() async {
  String config = await loadJsonData();
  Config.appConfig = jsonDecode(config);
  Config.appConfig["menuItems"].forEach((element) {
    Config.menuItems.add(MenuItems.fromJson(element));
  });
  AppTheme.headerBg =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['headerBg']));
  AppTheme.pageBg =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['pageBg']));
  AppTheme.headerText =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['headerText']));
  AppTheme.menuBg =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['menuBg']));
  AppTheme.menuItemBGColor =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['headerBg']));
  AppTheme.menuItemSelectedBgColor = Color(ColorUtils.hexToInt(
      Config.appConfig['appColor']['menuItemSelectedBgColor']));
  AppTheme.listTitle =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['listTitle']));
  AppTheme.listItemBg =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['listItemBg']));
  AppTheme.textColor =
      Color(ColorUtils.hexToInt(Config.appConfig['appColor']['textColor']));
  Network.baseUrl = Config.appConfig['mainConfig']['baseUrl'];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Buildler',
      theme: ThemeData(
        backgroundColor: AppTheme.pageBg,
        appBarTheme: AppBarTheme(
            backgroundColor: AppTheme.headerBg,
            titleTextStyle: TextStyle(color: AppTheme.headerText)),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppTheme.textColor,
              displayColor: AppTheme.textColor,
            ),
      ),
      home: HomePage(items: Config.menuItems),
    );
  }
}

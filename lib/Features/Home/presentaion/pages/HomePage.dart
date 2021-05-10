import 'package:appbuilder/Common/theme/appTheme.dart';
import 'package:appbuilder/Common/utils/helpers.dart';
import 'package:appbuilder/Features/Home/data/models/MenuItem.dart';
import 'package:appbuilder/Features/Posts/presentaion/pages/PostList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<MenuItems> items;
  HomePage({this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppTheme.listItemBg,
              child: ListTile(
                onTap: () {
                  if (items[index].parameters.userId == null) {
                    launchURL(items[index].parameters.url);
                  } else {
                    pushPage(context, PostsList());
                  }
                },
                title: Text(
                  items[index].title,
                  style: TextStyle(color: AppTheme.listTitle),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:appbuilder/Common/config/config.dart';
import 'package:appbuilder/Features/Home/data/models/MenuItem.dart';
import 'package:appbuilder/Features/Posts/data/Data%20Soucre/postsDataSource.dart';
import 'package:appbuilder/Features/Posts/data/models/posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureProvider<List<Posts>> postsStateFuture = FutureProvider<List<Posts>>((ref) {
  MenuItems posts = Config.menuItems
      .firstWhere((element) => element.parameters.userId != null);
  return PostsDataSource().getPosts(id: "${posts.parameters.userId}");
});

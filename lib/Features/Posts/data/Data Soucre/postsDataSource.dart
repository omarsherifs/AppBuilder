import 'package:appbuilder/Common/Network/Network.dart';
import 'package:appbuilder/Features/Posts/data/models/posts.dart';
import 'package:dio/dio.dart';

class PostsDataSource {
  Network networkClient = Network();

  Future<List<Posts>> getPosts({String id}) async {
    List<Posts> posts = [];
    Response res = await networkClient.getData(url: "posts?userId=$id");
    var data = res.data;
    data.forEach((element) {
      posts.add(Posts.fromJson(element));
    });
    return posts;
  }
}

import 'package:appbuilder/Common/utils/helpers.dart';
import 'package:appbuilder/Features/Posts/data/models/posts.dart';
import 'package:appbuilder/Features/Posts/presentaion/manager/postsStateManager.dart';
import 'package:appbuilder/Features/Posts/presentaion/pages/postDetails.dart';
import 'package:appbuilder/Features/Posts/presentaion/widgets/PostsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<List<Posts>> posts = watch(postsStateFuture);
    return Scaffold(
        appBar: AppBar(),
        body: posts.when(
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            data: (posts) => ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        pushPage(
                            context,
                            PostDetails(
                              post: posts[index],
                            ));
                      },
                      child: PostCard(
                        title: posts[index].title,
                      ),
                    );
                  },
                ),
            error: (err, stack) => Center(
                  child: Text("${err.toString}"),
                )));
  }
}

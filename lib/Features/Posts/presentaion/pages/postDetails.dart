import 'package:appbuilder/Features/Posts/data/models/posts.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  Posts post;
  PostDetails({this.post});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Text(
            "${widget.post.title}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "${widget.post.body}",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

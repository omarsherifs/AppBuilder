import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  String title;
  PostCard({this.title});
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Material(
          elevation: 5,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Center(
            child: Text(
              "${widget.title}",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_design_1/mySinglePost.dart';
import 'package:ui_design_1/myStyle.dart';
class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 385),
      child: Column(
        children: [
          SinglePost(),
          SinglePost(),
          SinglePost(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_design_1/AppBar.dart';
import 'package:ui_design_1/myStyle.dart';
import 'package:ui_design_1/posts.dart';
import 'Profile.dart';


void main()
{

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: mainColor,
          body: ListView(
            children: [
              Stack(
                children: [
                  MyPosts(),
                  ProfileBar(),
                  MyAppBar(),
        
                ],
        
              )
            ],
          ),
        ),
      ),
    );
  }
}

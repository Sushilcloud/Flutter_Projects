import 'package:flutter/material.dart';
import 'package:ui_design_1/myStyle.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey,borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
        )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile",style: titleText,),
            Icon(Icons.search,size: 30,)
          ],
          
        ),
    );
      //A

  }
}

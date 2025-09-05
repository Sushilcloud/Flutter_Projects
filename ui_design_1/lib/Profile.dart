import 'package:flutter/material.dart';
import 'package:ui_design_1/myStyle.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 170), // Add padding to the top
        width: double.infinity, // Set the width to fill the available space
        height: 380, // Set the height
        decoration: BoxDecoration( // Set the background color
            color: Colors.white,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0))
        ),

      child: Column( // Use a Column to stack the widgets vertically
        children: [  // Add the widgets to the Column
          CircleAvatar(), // Add a CircleAvatar widget
          SizedBox(height: 10), // Add some space between the widgets
          Text("Sushil KC",style: heading,), // Add a Text widget
          Text("Flutter Developer",style: heading,), // Add a Text widget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.location_on,size: 20,color: Colors.grey,), // Add an Icon widget
            Text("Kathmandu",style: TextStyle(color: Colors.grey,),) // Add a Text widget
          ],),
          SizedBox(height: 20), // Add some space between the widgets
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("121"),
                  Text("Post",style: followText,)
                ],
              ),
             SizedBox(width: 30,),
              Column(
                children: [
                  Text("20M"),
                  Text("Followers",style: followText,)
                ],
              ),
              SizedBox(width: 30,),
              Column(
                children: [
                  Text("121"),
                  Text("Following",style: followText,)
                ],
              )


            ],
          )
        ],
      ),

    );
  }
}

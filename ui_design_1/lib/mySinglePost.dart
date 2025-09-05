import 'package:flutter/material.dart';

import 'myStyle.dart';

class SinglePost extends StatelessWidget {
  const SinglePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),
                  topLeft:Radius.circular(50.0))),
              margin: EdgeInsets.only(left: 30),
              height: 140,
              width: double.infinity,
              child:ClipRRect(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),
                topLeft:Radius.circular(50.0)),
                  child: Image.asset("assets/images.jpg",fit: BoxFit.cover,))

            ),

          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 80,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subscribe the Flutter Today",style: postText,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.comment,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("15",style: postText,),
                  SizedBox(width: 10,),
                  Icon(Icons.favorite_border,size:16,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("150K",style: postText,)
                ],
              )
            ],

          ),
        ),
      SizedBox(height: 5,),
      ],

    );
  }
}

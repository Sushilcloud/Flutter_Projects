import 'package:flutter/material.dart';

class Text_Widget extends StatelessWidget {
  const Text_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Text Widget'),
        ),
        body: Text("This is Text Widget made by sushil, i live in dehradun, my home town"
            "is rishikesh",
        //  textDirection: TextDirection.ltr, // Text Widget Properties
        //  textAlign: TextAlign.center, // Text Widget Properties
        //  overflow: TextOverflow.ellipsis, // Text Widget Properties
        //  textScaleFactor: 5,
        //  softWrap: false,
        //  maxLines: 2,
        //  semanticsLabel: 'Hash Sign',
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: 20,
              wordSpacing: 20,
             // color: Colors.blue,
              foreground: Paint()
                ..color=Colors.grey
                ..strokeWidth=3.0
                ..style=PaintingStyle.stroke,

              background:Paint()
                ..color=Colors.black
                ..strokeWidth=4.0
                ..style=PaintingStyle.stroke,

           //   backgroundColor: Colors.yellow,

              fontStyle: FontStyle.italic,

              decoration: TextDecoration.underline,
                decorationColor: Colors.yellow,
                decorationStyle: TextDecorationStyle.wavy,
                decorationThickness: 10,

          ),


        ),

      ) // Text Widget Properties
    );
  }
}

import 'package:flutter/material.dart';

void run()
{
  runApp(align());
}
class align extends StatelessWidget {
  const align({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Align"),
          centerTitle: true,
        ),
        body: Align(alignment: Alignment.bottomCenter,
        child:
        Container(
          child: Text("Align Sushidls"),
          color: Colors.orange,
          height: 100,
          width: 100,
        ),



        ),


      ),

    );
  }
}

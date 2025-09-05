import 'package:flutter/material.dart';

void run()
{
  runApp(row());
  
}

class row extends StatelessWidget {
  const row({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: Text('Row')),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          textDirection: TextDirection.rtl,


          children: [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: Text("First"),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Text("Second"),
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
            child: Text("Third"),
          ),
          Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
            child: Text("Fourth"),
          ),
        ],),
      )

    );
  }
}

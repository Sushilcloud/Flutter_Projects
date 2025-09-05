import 'package:flutter_widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/widget6_Container.dart';

void run()
{
  runApp(center());
}
class center extends StatelessWidget {
  const center({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flex Widget"),),
          body: Center(
            heightFactor: 2,
            widthFactor: 2,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.orange,
            ),
          ),

      ),


    );
  }
}

import 'package:flutter_widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/widget6_Container.dart';

void run()
{
  runApp(flex());
}
class flex extends StatelessWidget {
  const flex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flex Widget"),),

        body: Flex(direction: Axis.horizontal,
          children: [
            Container(child: Text('First',
            style: TextStyle(fontSize: 30),),
              height: 100,
              width: 150,
              color: Colors.green,
              alignment: Alignment.center
        ),
            Container(child: Text('Second',
              style: TextStyle(fontSize: 30),),
                height: 100,
                width: 150,
                color: Colors.green,
                alignment: Alignment.center
            ),
            Container(child: Text('Third',
              style: TextStyle(fontSize: 30),),
                height: 100,
                width: 150,
                color: Colors.green,
                alignment: Alignment.center
            ),

          ],
        ),

        ),


    );
  }
}

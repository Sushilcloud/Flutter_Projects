import 'package:flutter/material.dart';

void run()
{
  runApp(column());
}
class column extends StatelessWidget {
  const column({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Column Widget'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            textDirection: TextDirection.ltr,
            verticalDirection: VerticalDirection.down,
            textBaseline: TextBaseline.alphabetic,
            
            children: [
              Container(
                padding: EdgeInsets.all(30),
                color: Colors.amber,
                child: Text('First Column',
                style:TextStyle(fontSize: 20),),
              ),
              Container(padding: EdgeInsets.all(30),
                color: Colors.blue,child: Text('Second Column',
                style:TextStyle(fontSize: 20),),
              ),
              Container(padding: EdgeInsets.all(30),
                color: Colors.green,child: Text('Third Column',
                style:TextStyle(fontSize: 20),),
              ),
              Container(padding: EdgeInsets.all(30),
                color: Colors.red,child: Text('Fourth Column',
                style:TextStyle(fontSize: 20),),
              ),
              Container(padding: EdgeInsets.all(30),
                color: Colors.yellow,child: Text('Fifth Column',
                style:TextStyle(fontSize: 20),),
              ),
          ],
          ),
        )
      ),
    );
  }
}

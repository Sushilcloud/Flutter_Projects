import 'package:flutter_widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/widget6_Container.dart';

void run()
{
  runApp(expended());
}
class expended extends StatelessWidget {
  const expended({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanded Widget"),),
          body: Column(
            children: [
              Flexible(
                flex:4,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.red,
                  alignment: Alignment.center,
                  width: 500,
                  child: Expanded(
                    child: Text('First',
                    style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('Second',
                    style: TextStyle(fontSize: 20),),
                  padding: EdgeInsets.all(30),
                  color: Colors.green,
                  alignment: Alignment.center,
                  width: 500,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('Third',
                    style: TextStyle(fontSize: 20),),
                  padding: EdgeInsets.all(30),
                  color: Colors.blue,
                  alignment: Alignment.center,
                  width: 500,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('Fourth',
                    style: TextStyle(fontSize: 20),),
                  padding: EdgeInsets.all(30),
                  color: Colors.purple,
                  alignment: Alignment.center,
                  width: 500,
                ),
              ),
            ],
          ),
      ),
    );
  }
}

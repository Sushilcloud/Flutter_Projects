import 'package:flutter/material.dart';


void main()
{
  runApp(defaultTextStyle());
}
class defaultTextStyle extends StatelessWidget {
  const defaultTextStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widgets Default Text Style"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            DefaultTextStyle(
                style: TextStyle(fontSize: 50,color: Colors.blue),
                child: Column(
                  children: [
                    Text("Flutter"),
                    Text("Widgets",style: TextStyle(fontSize: 20,color: Colors.red),),
                    Text("Default"),
                    Text("Text Style"),
                  ],
                ))
          ],
        ),


      ),
    );
  }
}

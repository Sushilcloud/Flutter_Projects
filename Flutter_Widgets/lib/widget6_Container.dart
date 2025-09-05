import 'package:flutter/material.dart';

void run()
{
  runApp(container());
}

class container extends StatelessWidget {
  const container({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
        ),
        body: Center(
          child: Container(color: Colors.amber, height: 150,width: 200,
          alignment: Alignment.center,transform: Matrix4.rotationX(50.0),
            child: Text("Hello",style: TextStyle(fontSize: 20),),
          ),
        ),
      )
    );
  }
}


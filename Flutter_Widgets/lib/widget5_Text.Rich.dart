import 'package:flutter/material.dart';

void run()

{
  runApp(textRich());
}
class textRich extends StatelessWidget {
  const textRich({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rich Text'),
        ),
        body: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Hello',
              style: TextStyle(fontSize: 24,color: Colors.blue),
              children: [
                TextSpan(
                  text: ' World',
                  style: TextStyle(fontSize: 30,color: Colors.red),
                ),
                TextSpan(
                  text: '!',
                  style: TextStyle(fontSize: 40,color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

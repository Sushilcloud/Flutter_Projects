import 'package:flutter/material.dart';
import 'package:flutter_widgets/main.dart';

void run()
{
  runApp(richText());
}
class richText extends StatelessWidget {
  const richText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rich Text"),
        ),
        body: Center(
          child: RichText(text: const TextSpan( //rich text
            text: "hello", //normal text
            style: TextStyle(fontSize: 20,color: Colors.blue),
            children: [
              TextSpan(
                text: "world",
                style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "flutter",
                style: TextStyle(fontSize: 20,color: Colors.green,fontStyle: FontStyle.italic),
              ),
            ]
          )),
        ),

      )
    );
  }
}

/* What is RichText?

RichText is a StatelessWidget used to display text with multiple styles
(fonts, colors, sizes, spans) inside a single text block.
It uses TextSpan objects to define different parts of the text.
Unlike Text, which applies a single style to the whole string, RichText lets you mix and match styles.*/
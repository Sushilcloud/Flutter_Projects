import 'package:flutter/material.dart';

void main()
{
  runApp(textSpan());
}
class textSpan extends StatelessWidget {
  const textSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( //
        appBar: AppBar(title:Text("This is Text Span"),),//
        body: Center(
          child: Text.rich( // rich Text uses for multiple text style
              TextSpan(text:'Hello',
              style: TextStyle(fontSize: 20),
              children: <InlineSpan>[
                  TextSpan(text:'world',style: TextStyle(fontSize: 40,color: Colors.red))
                  ]
              )


          )
        ),
       ),

    );
  }
}

import 'package:flutter/material.dart';

void run()
{
  runApp(container2());
}

class container2 extends StatelessWidget {
  const container2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Container'),
          ),
          body: Center(
            child:

            Column(
              children: [
                Container( height: 150,width: 200,
                  alignment: Alignment.center,transform: Matrix4.rotationX(50.0),
                  child: Text("Hello",style: TextStyle(fontSize: 30),),
                    decoration: BoxDecoration( //BoxDecoration
                    color: Colors.grey, //
                    border: Border.all(
                    color: Colors.blue,
                    width: 5,style: BorderStyle.solid),
                    shape: BoxShape.circle //Boxshape to circle


                    ),

                ),
                Container(
                   height: 150,width: 200,
                    alignment: Alignment.center,transform: Matrix4.rotationX(50.0),
                    child: Text("Hello Sushil",style: TextStyle(fontSize: 30),),
                    decoration: BoxDecoration( //BoxDecoration
                      color: Colors.grey, //
                      border: Border(
                         top: BorderSide(color: Colors.blue,width: 5,style: BorderStyle.solid),
                         bottom: BorderSide(color: Colors.green,width: 5,style: BorderStyle.solid),
                         left: BorderSide(color: Colors.red,width: 5,style: BorderStyle.solid),
                         right: BorderSide(color: Colors.black,width: 5,style: BorderStyle.solid))
                    ),

                  ),

                Container( height: 150,width: 200,
                  alignment: Alignment.center,transform: Matrix4.rotationX(50.0),
                  child: Text("Hello",style: TextStyle(fontSize: 30),),
                  decoration: BoxDecoration( //BoxDecoration
                    color: Colors.grey, //
                    border: Border.all(
                        color: Colors.blue,
                        width: 5,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50),

                  ),

                ),
                Container( height: 150,width: 200,
                  alignment: Alignment.center,transform: Matrix4.rotationX(50.0),
                  child: Text("Hello",style: TextStyle(fontSize: 30),),
                  decoration: BoxDecoration( //BoxDecoration
                    color: Colors.grey, //
                    border: Border.all(
                        color: Colors.blue,
                        width: 5,style: BorderStyle.solid),

                   borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),


                   ),


                  ),

                ),
              ],


            ),

          ),

        )
    );
  }
}


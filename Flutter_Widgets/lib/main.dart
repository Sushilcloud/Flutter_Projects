import 'package:flutter/material.dart';
import 'package:flutter_widgets/widget10_Expended_Flexible.dart';
import 'package:flutter_widgets/widget11_Flex.dart';
import 'package:flutter_widgets/widget12_Center.dart';
import 'package:flutter_widgets/widget1_Text.dart';
import 'package:flutter_widgets/widget2_DefaultTextStype.dart';
import 'package:flutter_widgets/widget3_TextSpan.dart';
import 'package:flutter_widgets/widget4_RichText.dart';
import 'package:flutter_widgets/widget5_Text.Rich.dart';
import 'package:flutter_widgets/widget6_Container.dart';
import 'package:flutter_widgets/widget7_Container2.dart';
import 'package:flutter_widgets/widget8_Column.dart';
import 'package:flutter_widgets/widget9_Row.dart';
import 'package:flutter/material.dart';

import 'Widget13_Align.dart';

void main()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget { //
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // home: Text_Widget() //
      // home: defaultTextStyle(),
      // home: textSpan()
      // home: richText()
      //home: textRich()
       // home: container()
       // home: container2()

    //  home:column()
       //   home: row()
     //         home:expended()
     // home: flex()
    //  home: center()
      home: align(),
    );
  }
}

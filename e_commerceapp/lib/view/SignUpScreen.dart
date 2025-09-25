import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(child: SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // back button
          IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded)),
          // create Account
          const SizedBox(height: 20,),
          Text(
            'Create Account',style: AppTextStyles.withColor(AppTextStyles.hi,
            Theme.of(context).textTheme.bodyLarge!.color!,),
          )
        ],

    ),
    ),
    ),
    );
  }
}

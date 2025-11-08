import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:e_commerceapp/view/widgets/category_chips.dart';
import 'package:e_commerceapp/view/widgets/filter_bottom_sheet.dart';
import 'package:e_commerceapp/view/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_screen.dart';

class  ShoppingScreen extends StatelessWidget {
  const  ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title:Text("Shopping",style:AppTextStyles.withColor(AppTextStyles.hi3,
            isDark ? Colors.white : Colors.black),

          ),

        actions: [
          // search icons
          IconButton(onPressed: ()=>Get.to(()=>const CartScreen()), icon: Icon(Icons.search,
            color: isDark ? Colors.white : Colors.black,
          )),

          // filter icon
          IconButton(onPressed: ()=>FilterBottomSheet.show(context), icon: Icon(Icons.filter_list,
            color: isDark ? Colors.white : Colors.black,
          )),

        ],
        centerTitle: true,
      ),

      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: CategoryChips(),
          ),
          Expanded(child: ProductGrid(),
          ),
        ]
      ),
    );
  }
}

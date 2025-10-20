import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:e_commerceapp/view/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,
        color: isDark ? Colors.white : Colors.black,
        )),
        title: Text("All Products",
        style: AppTextStyles.withColor(AppTextStyles.hi3,
        isDark? Colors.white : Colors.black,
        ),
        ),

        actions: [
        // search icons
          IconButton(onPressed: (){}, icon: Icon(Icons.search,
          color: isDark ? Colors.white : Colors.black,
    )),

          // filter icon
          IconButton(onPressed: ()=>FilterBottomSheet.show(context), icon: Icon(Icons.filter_list,
          color: isDark ? Colors.white : Colors.black,
    )),

        ],
      ),
    );
  }
}

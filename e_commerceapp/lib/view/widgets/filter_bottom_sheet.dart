import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FilterBottomSheet{
  static void show(BuildContext context){
    final isDark=Theme.of(context).brightness==Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context)=> StatefulBuilder(builder: (context,setState)=>Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Filter Product',
                style: AppTextStyles.withColor(AppTextStyles.hi3,
                Theme.of(context).textTheme.bodyLarge!.color!,
                ),),
                IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.close,
                  color: isDark?Colors.white:Colors.black,


                        ),        )
    ],

      ),
            const SizedBox(height: 24,),
            Text(
              'Price Range',style: AppTextStyles.withColor(AppTextStyles.hi3,
              Theme.of(context).textTheme.bodyLarge!.color!,

            ),),

            const SizedBox(height: 24,),
            Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Min',
                    prefixText: '\$',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isDark? Colors.grey[700]!: Colors.grey[300]!,

                      )
                    ),
                  ),

                  keyboardType: TextInputType.number,

                )),
                const SizedBox(width: 16,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Max',
                    prefixText: '\$',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: isDark? Colors.grey[700]!: Colors.grey[300]!,

                        )
                    ),
                  ),

                  keyboardType: TextInputType.number,

                ),
                )

              ],
            ),

            const SizedBox(height: 24,),
            Text(
              'Categories',style: AppTextStyles.withColor(AppTextStyles.hi3,
              Theme.of(context).textTheme.bodyLarge!.color!,

            ),),

            const SizedBox(height: 16,),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'All',
                'Shoe',
                'Clothing',
                'Accessories',
                'Bags',
                'Electronics'


              ].map((category)=>FilterChip(
                label: Text(category),
                selected: category=='All',
                onSelected: (selected){},
                backgroundColor: Theme.of(context).cardColor,
                selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                labelStyle: AppTextStyles.withColor(
                 AppTextStyles.bodyMedium,
                  category=='All'
                      ?Theme.of(context).primaryColor:
                  Theme.of(context).textTheme.bodyLarge!.color!,


                ),


              )).toList(),

            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),),
                child: Text('Apply Filters',style: AppTextStyles.withColor(AppTextStyles.bodyMedium, Colors.white),),
              ),

            )

],

        ),
      ),
      ));

}
}
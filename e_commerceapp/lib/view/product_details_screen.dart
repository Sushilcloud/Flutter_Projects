import 'dart:ffi';

import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:e_commerceapp/view/widgets/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    final screenHeight=screenSize.height;
    final screenWidth=screenSize.width;
    final isDark=Theme.of(context).brightness==Brightness.dark;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,color: isDark? Colors.white: Colors.black,
            )),
        title: Text('Details',
          style: AppTextStyles.withColor(
            AppTextStyles.hi3,
          isDark? Colors.white: Colors.black),),
        actions: [
          IconButton(onPressed: ()=> _shareProduct(
            context,
            product.name,
            product.description,

          ),
              icon: Icon(Icons.share,color: isDark? Colors.white: Colors.black,))

        ],
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
            AspectRatio(aspectRatio: 16/9,
              child: Image.asset(product.imageUrl,
              width:double.infinity,
                fit: BoxFit.cover,

            ),
            ),
            // favorite button
            Positioned(child: IconButton(
                onPressed:(){},
                icon: Icon(
                  product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.isFavorite
                      ? Theme.of(context).primaryColor
                      :(isDark? Colors.white: Colors.black),
                ),
                ))
          ]
            ),
            // product details
            Padding(padding: EdgeInsets.all(screenWidth *0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(
                          product.name,
                        style: AppTextStyles.withColor(
                          AppTextStyles.hi2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),

                          ),

                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextStyles.withColor(
                          AppTextStyles.hi2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                     ],
                  ),
                  Text(
                    product.category,
                    style: AppTextStyles.withColor(
                      AppTextStyles.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,


                    ),
                  ),
                  SizedBox(height: screenHeight*0.02),
                  Text(
                    'Select Size',
                    style: AppTextStyles.withColor(
                      AppTextStyles.labelMedium,

                      Theme.of(context).textTheme.bodyLarge!.color!,

                    ),
                  ),
                  SizedBox(height: screenHeight*0.01),
                  // size selector
                  const SizeSelector(),
                  SizedBox(height: screenHeight*0.02),
                  Text(
                    'Description',
                    style: AppTextStyles.withColor(
                      AppTextStyles.bodySmall,
                      isDark? Colors.grey[400]! : Colors.grey[600]!
                      ,

                    ),
                  ),

                ],
              ),
            ),
          ],

      ),
      ),

      //button
      bottomNavigationBar: SafeArea(child: Padding(padding: EdgeInsets.all(screenWidth*0.04),
        child: Row(
          children: [
            Expanded(child:
            OutlinedButton(
                onPressed: (){},style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight*0.02,

            ),
              side: BorderSide(
              color: Theme.of(context).primaryColor,
              ),
          ),
             child: Text('Add to Cart', style: AppTextStyles.withColor(AppTextStyles.buttonMedium,
                 Theme.of(context).textTheme.bodyLarge!.color!,
             ),))
            ),
            SizedBox(width: screenWidth*0.02),

          ]
        ),
)),
    );
  }

  Future<void> _shareProduct(
      BuildContext context,
      String productName,
      String description,
      ) async {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    const String shopLink = 'https://yourshop.com/product/cotton-tshirt';
    final String shareMessage = '$description\n\nShop Now at $shopLink';

    try {
      await Share.share(
        shareMessage,
        subject: productName,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
      debugPrint('Share dialog opened');
    } catch (e) {
      debugPrint('Error sharing: $e');
    }
  }


}

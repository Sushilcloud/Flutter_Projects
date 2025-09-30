import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final screenWidth=MediaQuery.of(context).size.width;
    final isDark=Theme.of(context).brightness==Brightness.dark;
    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth*0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark? Colors.black.withOpacity(0.3): Colors.grey.withOpacity(0.1),

            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0,2),
          )
        ]
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              //image
              AspectRatio(aspectRatio: 16/9,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )


              ),
              ),

              // favorite button
              Positioned(
                top: 8,
                right: 8,
                  child: IconButton(
                    icon: Icon(
                      product.isFavorite? Icons.favorite:Icons.favorite_border,
                      color: product.isFavorite?
                      Theme.of(context).primaryColor:
                      isDark?Colors.grey[400]:Colors.grey,
                    ),
                    onPressed: (){},
                  ),
                    ),
              if(product.oldPrice!=null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // discount text
                    child: Text(
                      '',style: AppTextStyles.withColor(
                        AppTextStyles.withWeight(AppTextStyles.bodySmall, FontWeight.bold),
                        Colors.white,),
                    ),
                  ),
                )



            ],


          ),
          // product details
          Padding(
            padding:  EdgeInsets.all(screenWidth*.02,),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.withColor(AppTextStyles.withWeight(
                    AppTextStyles.hi3,
                    FontWeight.bold),Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                    maxLines: 1,
                  overflow: TextOverflow.ellipsis,),

                SizedBox(height: screenWidth*.01),
                Text(
                product.category,
                  style: AppTextStyles.withColor(
                  AppTextStyles.bodyMedium,
                      isDark ? Colors.grey[400]!:Colors.grey[600]!),
                  ),

                SizedBox(height: screenWidth*.01),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                          style: AppTextStyles.withColor(AppTextStyles.withWeight(
                        AppTextStyles.bodyLarge,FontWeight.bold),
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                    ),

                    if(product.oldPrice!=null)...[
                      SizedBox(width: screenWidth*.01),

                    ]
                  ],
                )
              ],
              ),

            ),





              ],
            ),




    );
  }
}

import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Get Your',
                style: AppTextStyles.withColor(
                    AppTextStyles.hi3,Colors.white
                ),
              ), // Get Your
              Text('Special Sale',
                style: AppTextStyles.withColor(
                    AppTextStyles.withWeight(
                        AppTextStyles.hi2,
                      FontWeight.bold,
                ),
                Colors.white,
              )),
              Text('40%',
                style: AppTextStyles.withColor(
                  AppTextStyles.hi3,
                  Colors.white,
                ),
              ),
            ],
      ),
    ),
          ElevatedButton(onPressed:(){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

              ),

              child: Text('Shop Now',
                style: AppTextStyles.buttonMedium,
      ),),

    ],
      ),

    );
  }
}

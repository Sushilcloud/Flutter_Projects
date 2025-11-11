import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;


  const OrderCard({super.key,
    required this.order,
    required this.onViewDetails});

  @override
  Widget build(BuildContext context) {
    final isDark= Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color:Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark? Colors.black.withOpacity(0.05): Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),

          )
        ]
      ),
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: AssetImage(order.imageUrl),fit: BoxFit.cover)
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order #${order.orderNumber}',
                      style: AppTextStyles.withColor(AppTextStyles.hi3, Theme.of(context).textTheme.bodyLarge!.color!),),

                  ]
                ))
              ],
            ),)
        ],
      ),

    );
  }
}

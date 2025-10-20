import 'package:e_commerceapp/view/all_product_screen.dart';
import 'package:e_commerceapp/view/widgets/category_chips.dart';
import 'package:e_commerceapp/view/widgets/custom_search_bar.dart';
import 'package:e_commerceapp/view/widgets/product_grid.dart';
import 'package:e_commerceapp/view/widgets/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body:  SafeArea(
          child: Column(
        children: [
          // header section
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello Alex',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  ),
                  Text('Good Morning!',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // notification icon
              const Spacer(),
              IconButton(
                onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                  ),
              ),
              // cart Button
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),

              //theme button
              GetBuilder<ThemeController>(
                builder: (controller) => IconButton(
                  onPressed: () {
                    controller.toggleTheme();
                  },
                  icon: Icon(
                    controller.isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                ),
              ),
            ],
              ),
        ),

          //search bar
          const CustomSearchBar(),

          // category chips
          const CategoryChips(),

          // sale banner
          const SaleBanner(),

          // popular product
           Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Popular Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: ()=>Get.to(()=>const AllProductScreen()),
                  child:  Text(
                    'See All',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),

                  ),
                ),

              ],

            ),
          ),

          // product grid
          const Expanded(child: ProductGrid()),


      ],

    ),
    ),
    );
  }
}

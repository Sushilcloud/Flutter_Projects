import 'package:e_commerceapp/view/shopping_screen.dart';
import 'package:e_commerceapp/view/widgets/custom_botton_navbar.dart';
import 'package:e_commerceapp/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/navigation_controller.dart';
import '../controllers/theme_controller.dart';
import 'account_screen.dart';
import 'home_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(NavigationController());
    return GetBuilder<ThemeController>(
            builder: (themeController) => Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body:  AnimatedSwitcher(
                duration:const Duration(milliseconds: 200),
                child: Obx(
                    ()=>IndexedStack(
                      key: ValueKey(navigationController.currentIndex.value),
                      index: navigationController.currentIndex.value,
                      children: const[
                        HomeScreen(),
                        ShoppingScreen(),
                        WishlistScreen(),
                        AccountsScreen(),

                      ],

                    )
                ),
              ),
              // bottom navigation bar
              bottomNavigationBar: CustomBottonNavbar(),

            ),
            );

  }
}

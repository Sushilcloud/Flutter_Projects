import 'package:e_commerceapp/controllers/theme_controller.dart';
import 'package:e_commerceapp/utils/app_themes.dart';
import 'package:e_commerceapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/auth_controller.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage
  Get.put(ThemeController()); // Inject ThemeController
  Get.put(AuthController()); // Inject AuthController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController =
        Get.find<ThemeController>(); // Retrieve ThemeController
    return GetMaterialApp(
      // Use GetMaterialApp instead of MaterialApp
      title: 'Fashion Store',
      theme: AppThemes.light, // Define light theme
      darkTheme: AppThemes.dark, // Define dark theme
      themeMode: themeController.theme, // Use themeMode from ThemeController
      defaultTransition: Transition.fade,

      home:  SplashScreen(),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

import 'package:e_commerceapp/controllers/theme_controller.dart';
import 'package:e_commerceapp/utils/app_themes.dart';
import 'package:e_commerceapp/view/main_screen.dart';
import 'package:e_commerceapp/view/onboarding_screen.dart';
import 'package:e_commerceapp/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // navigate based on auth state after 2.5 sec
    Future.delayed(const Duration(microseconds: 2500), () {
      if (authController.isFirstTime) {
        Get.off(()=>const OnboardingScreen());
      } else if (authController.isLoggedIn) {
        Get.off(()=>const MainScreen());
      } else {
        Get.off(()=>SigninScreen());
      }
    }
      );




    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: GridPattern(color: Colors.white),
              ),
            ),
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,


              children: [
                TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0,end:1.0),
                    duration: const Duration (milliseconds: 1200),builder: (context,value,child){
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: const Offset(0,4),)


                            ],
                          ),
                          child: Icon(Icons.shopping_bag_outlined, //Icons.shopping_bag_outlined,
                          size:48 ,
                          color:Theme.of(context).primaryColor,),
                        )
                      );
                 },
                ),
                const SizedBox(height: 20,),

                // animated text
                TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0,end:1.0),
                    duration: const Duration (milliseconds: 1200),builder: (context,value,child) {
                  return Opacity(opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                  child: Column(
                    children: [
                      Text("Fashion",style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 8,
                      ),),
                      Text("Store",style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 4,
                      ),)
                    ],
                  ),
                ),






                ],
            ),
            ),
            // botton tagline
            // style Meet Simplicity
            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child:  TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0,end:1.0),
                duration: const Duration (milliseconds: 1200),builder: (context,value,child) {
                return Opacity(opacity: value,
                  child: child,
                );
              },
                child: Text('Style Meet Simplicity',
                  textAlign: TextAlign.center,style: TextStyle(color: Colors.white.withOpacity(0.9),
                      fontSize: 14,letterSpacing: 2,fontWeight: FontWeight.w300),
                ),
              ),
            ),
            // bottom tag end here
          ],
        ),
      ),
    );
  }
}

class GridPattern extends StatelessWidget {
  final Color color;
  const GridPattern({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: GridPainter(color: color));
  }
}

class GridPainter extends CustomPainter {
  final Color color;
  GridPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    final spacing = 20.0;

    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double x = 0; x <= size.height; x += spacing) {
      canvas.drawLine(Offset(0, x), Offset(size.width, x), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

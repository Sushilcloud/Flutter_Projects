import 'package:e_commerceapp/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_textstyles.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});

   final TextEditingController _emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            //back button
            IconButton(onPressed: ()=>Get.back(),
                icon: Icon(
                    Icons.arrow_back_ios,color: isDark ? Colors.white : Colors.black,
                ),
            ),
            // Forgot Password
            const SizedBox(height: 20,),
            Text(
              'Reset Password',
                style: AppTextStyles.withColor(AppTextStyles.hi,
              Theme.of(context).textTheme.bodyLarge!.color!,
                ),
            ),

            const SizedBox(height: 8,),
            Text('Ener your email to reset your password',
            style: AppTextStyles.withColor(AppTextStyles.bodyLarge,
            isDark? Colors.grey[400]! : Colors.grey[600]!),
            ),

            const SizedBox(height: 40,),
            // email textfield

      CustomTextfield(
        label: "Email",
        prefixIcon: Icons.email_outlined,
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          if (!GetUtils.isEmail(value)) {
            return "Please enter a valid email";
          }
          return null;
        },
      ),

      // send reset link button
      const SizedBox(height: 24,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  showAccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),

            ),
                child: Text("Send Reset Link",
                  style: AppTextStyles.withColor(
                      AppTextStyles.buttonMedium,Colors.white),
                ),
              ),

            ),
    ],


    ),
    ),
      ),
    );
  }

  // show access dialoge
  void showAccessDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Check your mail',
        style: AppTextStyles.hi3,
        ),
        content: Text('We have sent password recovery instructions to your email',
          style: AppTextStyles.bodyMedium,
      ),
        actions: [TextButton(onPressed: ()=>Get.back(), child: Text('OK',
        style: AppTextStyles.withColor(AppTextStyles.buttonMedium,
            Theme.of(context).primaryColor,)
          ,)
          ,)
        ],
      ),
    );
  }
}

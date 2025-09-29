import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:e_commerceapp/view/SignUpScreen.dart';
import 'package:e_commerceapp/view/main_screen.dart';
import 'package:e_commerceapp/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'forget_password_screen.dart';


class SigninScreen extends StatelessWidget {
   SigninScreen({super.key});

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      body: SafeArea( // uses for safe area
          child: SingleChildScrollView( // Wrap with SingleChildScrollView
            padding: EdgeInsets.all(24), // Add padding
            child: Column( // Use Column for vertical alignment
              crossAxisAlignment: CrossAxisAlignment.start, // uses for horizontal alignment
              children: [ // List of widgets
                SizedBox(height: 40), // Add spacing

                Text("Welcome Back!",style: AppTextStyles.withColor(AppTextStyles.hi,
                    Theme.of(context).textTheme.bodyLarge!.color!),),
                const SizedBox(height: 8,),
                Text("Sign in to Continue Shopping!",style: AppTextStyles.withColor(AppTextStyles.bodyLarge,
                    isDark? Colors.grey[400]! : Colors.grey[600]!),),
                const SizedBox(height: 40,),
                //email textfield

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
                SizedBox(height: 25,),

                // Password textField

                CustomTextfield(
                  label: "Password",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Password";
                    }

                    return null;
                  },
                ),
               const SizedBox(height: 16,),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: ()=>Get.to(()=>ForgetPasswordScreen()),
                      child:Text("Forgot Password?",
                        style: AppTextStyles.withColor(AppTextStyles.buttonMedium,
                        Theme.of(context).primaryColor
                        ), // Use primaryColor from Theme
                      ),
                  ),
                ),

                const SizedBox(height: 24,),

                // sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed:_handleSignIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),

                    ),
                    child: Text("Sign In",style: AppTextStyles.withColor(AppTextStyles.buttonMedium,Colors.white),),),

                ),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: AppTextStyles.withColor(AppTextStyles.bodyLarge,
                        isDark? Colors.grey[400]! : Colors.grey[600]!),),
                    TextButton(onPressed: ()=>Get.to(()=>Signupscreen(),), child: Text("Sign Up",style: AppTextStyles.withColor(AppTextStyles.buttonMedium,
                        Theme.of(context).primaryColor),))
                  ],
                )
              ],

          )),
      ),
    );

  }
  void _handleSignIn() {
   final AuthController authController=Get.find<AuthController>();
   authController.login();
   Get.offAll(()=>const MainScreen());
  }
  }


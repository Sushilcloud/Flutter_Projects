import 'package:e_commerceapp/utils/app_textstyles.dart';
import 'package:e_commerceapp/view/main_screen.dart';
import 'package:e_commerceapp/view/signin_screen.dart';
import 'package:e_commerceapp/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signupscreen extends StatelessWidget {

   Signupscreen({super.key});

  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(child: SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // back button
          IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded)),
          // create Account
          const SizedBox(height: 20,),
          Text(
            'Create Account',style: AppTextStyles.withColor(AppTextStyles.hi,
            Theme.of(context).textTheme.bodyLarge!.color!,),
          ),
          const SizedBox(height: 20,),

          Text(
            'Signup to get started',style: AppTextStyles.withColor(AppTextStyles.hi,
            Theme.of(context).textTheme.bodyLarge!.color!,),
          ),
          const SizedBox(height: 20,),
          // full name text field
          CustomTextfield(
            label: "Full Name",
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
            isPassword: true,
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your Name";
              }

              return null;
            },
          ),

          // email text field

          const SizedBox(height: 20,),

          CustomTextfield(
            label: "Email",
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            isPassword: true,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your Email";
              }if (!GetUtils.isEmail(value)) {
                return "Please enter a valid Email";
              }

              return null;
            },
          ),

          const SizedBox(height: 20,),

          // password text field
          CustomTextfield(
            label: "Password",
            prefixIcon: Icons.lock_outline,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your Password";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),
          // confirm password text field
          CustomTextfield(
            label: "Confirm Password",
            prefixIcon: Icons.lock_outline,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            controller: _confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your Confirm Password";
              }
              if (value != _passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: ()=>Get.off(()=>MainScreen()),
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),

                child: Text('Sign UP',
                  style: AppTextStyles.withColor(AppTextStyles.buttonMedium,
                      Colors.white),)),
          ),

          const SizedBox(height: 20,),
          // signin Textbutton
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?',
                style: AppTextStyles.withColor(
                    AppTextStyles.bodyMedium,
                    Theme.of(context).textTheme.bodyLarge!.color!,

                ),
              ),
              TextButton(
                  onPressed: ()=>Get.off(()=>SigninScreen(),),
                  child: Text('Sign In',
                    style: AppTextStyles.withColor(
                        AppTextStyles.buttonMedium,
                        Theme.of(context).primaryColor
                    ),
                  ),
              )
            ],
          ),

        ],
          ),



    ),
    ),
    );
  }
}

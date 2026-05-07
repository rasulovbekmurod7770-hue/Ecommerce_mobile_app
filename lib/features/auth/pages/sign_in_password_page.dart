import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/pages/tell_us_abt_yourself.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignInPasswordPage extends StatelessWidget {
  const SignInPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(padding: const .symmetric(horizontal: 23), 
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const SizedBox(height: 123,), 
          Text("Sign in", style: AppTextStyles.heading,), 
          const SizedBox(height: 32,), 
          Textfieldforauth(hint: "Password"), 
          const SizedBox(height: 16,), 
          MainButton(text: "Continue", height: 49, width: .infinity, page: TellUsAbtYourself(),), 
          const SizedBox(height: 16,), 
          Row(
            children: [
              Text("Forgot password ? ", style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 12,
                    fontWeight: .w700,
                  ),), 
                  InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: .w700,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      ),
    );
  }
}
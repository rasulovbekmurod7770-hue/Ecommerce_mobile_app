import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/pages/forgot_password.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const .symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 63),
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.secondaryColor,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: .only(left: 8),
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            const SizedBox(height: 20),
            Text("Create Account", style: AppTextStyles.heading),
            const SizedBox(height: 32),
            Column(
              spacing: 16,
              children: [
                Textfieldforauth(hint: "Firstname"),
                Textfieldforauth(hint: "Lastname"),
                Textfieldforauth(hint: "Email address"),
                Textfieldforauth(hint: "password"),
              ],
            ),
            const SizedBox(height: 40,), 
            MainButton(text: "Continue", height: 49, width: .infinity, page: ForgotPassword() ), 
            const SizedBox(height: 40,), 
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

import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/pages/reset_password_succes.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    passwordcontroller.dispose();
    super.dispose();
  }

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
                padding: const .only(left: 8),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Forgot Password", style: AppTextStyles.heading),
            const SizedBox(height: 35),
            Textfieldforauth(
              hint: "Enter Email address",
              controller: passwordcontroller,
            ),
            const SizedBox(height: 24),
            MainButton(
              text: "Continue",
              height: 49,
              width: .infinity,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

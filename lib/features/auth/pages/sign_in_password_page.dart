import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/pages/tell_us_abt_yourself.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignInPasswordPage extends StatefulWidget {
  SignInPasswordPage({super.key});

  @override
  State<SignInPasswordPage> createState() => _SignInPasswordPageState();
}

class _SignInPasswordPageState extends State<SignInPasswordPage> {
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
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
            const SizedBox(height: 123),
            const Text("Sign in", style: AppTextStyles.heading),
            const SizedBox(height: 32),
            Textfieldforauth(hint: "Password", controller: passwordController),
            const SizedBox(height: 16),
            MainButton(
              text: "Continue",
              height: 49,
              width: .infinity,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "Forgot password ? ",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 12,
                    fontWeight: .w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

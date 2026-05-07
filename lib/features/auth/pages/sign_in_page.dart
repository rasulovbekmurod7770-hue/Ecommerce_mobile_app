import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/pages/sign_in_password_page.dart';
import 'package:clothing_app_ui/features/auth/pages/sign_up_page.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/signinways_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const .symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 123),
            Text("Sign in", style: AppTextStyles.heading),
            const SizedBox(height: 32),
            Textfieldforauth(hint: "Email Address"),
            const SizedBox(height: 16),
            MainButton(text: "Continue", width: .infinity, height: 49, page: SignInPasswordPage(),),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Dont have an Account ? ",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 12,
                    fontWeight: .w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                  },
                  child: Text(
                    "Create one",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 71,), 
            Signinwaysbutton(icon: Icons.facebook, text: "Continue With Apple",), 
            const SizedBox(height: 12,), 
            Signinwaysbutton(icon: Icons.telegram, text: "Continue With Google"), 
            const SizedBox(height: 12,), 
            Signinwaysbutton(icon: Icons.facebook, text: "Continue With Facebook")
          ],
        ),
      ),
    );
  }
}


import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/cubit/auth_cubit.dart';
import 'package:clothing_app_ui/features/auth/models/auth_model.dart';
import 'package:clothing_app_ui/features/auth/pages/forgot_password.dart';
import 'package:clothing_app_ui/features/auth/pages/sign_in_page.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
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
            const Text("Create Account", style: AppTextStyles.heading),
            const SizedBox(height: 32),
            Column(
              spacing: 16,
              children: [
                Textfieldforauth(
                  hint: "Firstname",
                  controller: firstNameController,
                ),
                Textfieldforauth(
                  hint: "Lastname",
                  controller: lastNameController,
                ),
                Textfieldforauth(
                  hint: "Email address",
                  controller: emailController,
                ),
                Textfieldforauth(
                  hint: "password",
                  controller: passwordController,
                ),
              ],
            ),
            const SizedBox(height: 40),
            MainButton(
              text: "Continue",
              height: 49,
              width: .infinity,
              onPressed: () {
                final AuthModel newuser = AuthModel(
                  firstName: firstNameController.text.toString(),
                  lastName: lastNameController.text.toString(),
                  email: emailController.text.toString(),
                  password: passwordController.text.toString(),
                );
                context.read<AuthCubit>().createUser(newuser);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage(),));
              },
            ),
            const SizedBox(height: 40),
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

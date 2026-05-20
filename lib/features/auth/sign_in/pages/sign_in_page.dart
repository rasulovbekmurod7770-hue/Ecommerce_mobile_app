import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_state.dart';
import 'package:clothing_app_ui/features/auth/sign_in/models/sign_in_model.dart';
import 'package:clothing_app_ui/features/auth/sign_up/pages/sign_up_page.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/signinways_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:clothing_app_ui/features/auth/pages/tell_us_abt_yourself.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLogin(BuildContext context) {
    context.read<SignInCubit>().login(
          SignInModel(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const TellUsAbtYourself()),
            (_) => false,
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is SignInLoading;
        return Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 123),
                const Text("Sign in", style: AppTextStyles.heading),
                const SizedBox(height: 32),
                Textfieldforauth(
                  hint: "Email Address",
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                Textfieldforauth(
                  hint: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 16),
                MainButton(
                  text: isLoading ? "Loading..." : "Continue",
                  width: double.infinity,
                  height: 49,
                  onPressed: isLoading ? () {} : () => _onLogin(context),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      "Dont have an Account ? ",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create one",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 71),
                Signinwaysbutton(
                  icon: Icons.apple,
                  text: "Continue With Apple",
                ),
                const SizedBox(height: 12),
                Signinwaysbutton(
                  icon: Icons.g_mobiledata,
                  text: "Continue With Google",
                ),
                const SizedBox(height: 12),
                Signinwaysbutton(
                  icon: Icons.facebook,
                  text: "Continue With Facebook",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

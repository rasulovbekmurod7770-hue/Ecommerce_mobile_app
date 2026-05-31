import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_up/cubit/sign_up_state.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/sign_up_model.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/cubit/user_cubit.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/pages/tell_us_abt_yourself.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

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
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Padding(
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
                    final SignUpModel newuser = SignUpModel(
                      firstName: firstNameController.text.toString(),
                      lastName: lastNameController.text.toString(),
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    );
                    context.read<SignUpCubit>().createUser(newuser);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider(
                            create: (context) => UserCubit(),
                            child: const TellUsAbtYourself(userId: 10),
                          );
                        },
                      ),
                    );
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
          );
        },
      ),
    );
  }
}

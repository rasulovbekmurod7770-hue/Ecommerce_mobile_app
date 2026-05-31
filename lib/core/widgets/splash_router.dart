import 'package:clothing_app_ui/core/routes/app_pages.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_state.dart';
import 'package:clothing_app_ui/features/auth/sign_in/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashRouter extends StatelessWidget {
  const SplashRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (_, state) => state is TokenExists,
      listener: (context, state) {
        if (state is TokenExists) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppPages.homePage,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (_, state) =>
            state is TokenChecking ||
            state is TokenExists ||
            state is TokenNotFound,
        builder: (context, state) {
          if (state is TokenNotFound) {
            return const SignInPage();
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

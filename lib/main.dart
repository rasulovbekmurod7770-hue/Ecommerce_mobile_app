import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_state.dart';
import 'package:clothing_app_ui/features/auth/sign_in/pages/sign_in_page.dart';
import 'package:clothing_app_ui/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:clothing_app_ui/features/auth/pages/tell_us_abt_yourself.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SignInCubit(authRepository: AuthRepo())..checkToken(),
          ),
          BlocProvider(create: (_) => SignUpCubit()),
        ],
        child: const SplashRouter(),
      ),
    );
  }
}

class SplashRouter extends StatelessWidget {
  const SplashRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (_, state) =>
          state is TokenChecking ||
          state is TokenExists ||
          state is TokenNotFound,
      builder: (context, state) {
        if (state is TokenExists) {
          return const TellUsAbtYourself();
        }
        if (state is TokenNotFound) {
          return const SignInPage();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


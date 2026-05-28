import 'package:clothing_app_ui/core/routes/app_pages.dart';
import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_up/cubit/sign_up_cubit.dart';
// import 'package:clothing_app_ui/features/auth/sign_up/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/home/main/main_screen.dart';
import 'package:clothing_app_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppPages.homePage:
        return MaterialPageRoute(
          builder: (context) {
            return const MainScreen();
          },
        );
      case AppPages.signIn:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      SignInCubit(authRepository: AuthRepo())..checkToken(),
                ),
                BlocProvider(create: (_) => SignUpCubit()),
              ],
              child: const SplashRouter(),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const PageNotFound();
          },
        );
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found', style: TextStyle(fontSize: 44.0)),
      ),
    );
  }
}

import 'package:clothing_app_ui/core/routes/app_pages.dart';
import 'package:clothing_app_ui/core/widgets/splash_router.dart';
import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:clothing_app_ui/features/auth/sign_up/pages/sign_up_page.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/cubit/user_cubit.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/pages/tell_us_abt_yourself.dart';
import 'package:clothing_app_ui/features/home/categories/cubit/categories_cubit.dart';
import 'package:clothing_app_ui/features/home/cubit/product_cubit.dart';
// import 'package:clothing_app_ui/features/auth/sign_up/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/home/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppPages.homePage:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CategoriesCubit()),
                BlocProvider(create: (context) => ProductCubit()),
              ],
              child: const MainScreen(),
            );
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
      case AppPages.tellUs:
        final userId = args as int;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => UserCubit(),
              child: TellUsAbtYourself(userId: userId),
            );
          },
        );
      case AppPages.signUp:
        // final userId = args as int;R
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => SignUpCubit(),
              child: const SignUpPage(),
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

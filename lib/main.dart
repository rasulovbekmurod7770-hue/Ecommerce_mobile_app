import 'package:clothing_app_ui/core/routes/app_pages.dart';
import 'package:clothing_app_ui/core/routes/app_routes.dart';
// import 'package:clothing_app_ui/features/auth/pages/tell_us_abt_yourself.dart';
import 'package:flutter/material.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: AppPages.homePage ,
    );
  }
}

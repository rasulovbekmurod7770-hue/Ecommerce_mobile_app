import 'package:clothing_app_ui/core/provider/cart_provider.dart';
import 'package:clothing_app_ui/features/address/address_screen.dart';
import 'package:clothing_app_ui/features/notifications/widgets/notification_exist_page.dart';
import 'package:clothing_app_ui/features/notifications/pages/notifications_screen.dart';
import 'package:clothing_app_ui/features/order_placed_success/order_placed_screen.dart';
import 'package:clothing_app_ui/features/orders/pages/order_detail.dart';
import 'package:clothing_app_ui/features/orders/pages/orders_screen.dart';
import 'package:clothing_app_ui/features/orders/widgets/orders_exist_screen.dart';
import 'package:clothing_app_ui/features/payment/pages/add_card.dart';
import 'package:clothing_app_ui/features/payment/pages/payment_screen.dart';
import 'package:clothing_app_ui/features/profile/profile_screen.dart';
import 'package:clothing_app_ui/features/wishlist/wishlist_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: WishlistScreen()
      
      // ChangeNotifierProvider(create: (context) => CartProvider(),
      // child: ProfileScreen(),)
    );
  }
}


import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/orders/widgets/no_orders_screen.dart';
import 'package:clothing_app_ui/features/orders/widgets/orders_exist_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  final bool isOrdersEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: isOrdersEmpty ? OrdersExist() : NoOrders(),
    );
  }
}
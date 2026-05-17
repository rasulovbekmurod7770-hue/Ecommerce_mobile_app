import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/cart/widgets/cart_is_empty.dart';
import 'package:clothing_app_ui/features/cart/widgets/cart_is_not_empty.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: isEmpty ? CartIsEmpty() : CartisNotEmpty(),
      bottomNavigationBar: isEmpty
          ? null
          : Container(
              padding: .symmetric(vertical: 14),
              height: 80,
              child: padded(
                MainButton(
                  text: "Checkout",
                  height: 52,
                  width: .infinity,
                  onPressed: () {},
                ),
              ),
            ),
    );
  }
}

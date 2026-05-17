import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/core/provider/cart_provider.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/checkout/pages/checkout_screenn_filled.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: padded(
        Column(
          children: [
            const SizedBox(height: 74),
            Row(
              // spacing: 113,
              mainAxisAlignment: .spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 20,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ),
                const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w700,
                    color: AppColors.colorBlack,
                  ),
                ),
                const SizedBox(height: 16, width: 16),
              ],
            ),
            const SizedBox(height: 32),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const .symmetric(horizontal: 12, vertical: 12),
                width: .infinity,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: .circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 4,
                      children: [
                        Text(
                          "Payment Method",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          "Add Payment Method",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: .w500,
                            color: AppColors.colorBlack,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 24),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const .symmetric(horizontal: 12, vertical: 12),
                width: .infinity,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: .circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 4,
                      children: [
                        Text(
                          "Shipping Address",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          "Add Shipping Address",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: .w500,
                            color: AppColors.colorBlack,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 24),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 258),
            Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Color(0xff27272780),
                      ),
                    ),
                    Text("\$${cart.subtotal}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text(
                      "Shipping Cost",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Color(0xff27272780),
                      ),
                    ),
                    Text("\$${cart.shippingCost}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text(
                      "Tax",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Color(0xff27272780),
                      ),
                    ),
                    Text("\$${cart.tax}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Color(0xff27272780),
                      ),
                    ),
                    Text("\$${cart.total}"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const .symmetric(vertical: 14),
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

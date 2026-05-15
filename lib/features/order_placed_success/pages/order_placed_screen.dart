import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          const SizedBox(height: 154),
          SizedBox(
            height: 252,
            width: 317,
            child: Image(image: AssetImage("assets/images/successf.png")),
          ),
          const SizedBox(height: 68),
          Expanded(
            child: Container(
              width: .infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: padded(
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "Order Placed \nSuccessfully",
                      style: AppTextStyles.heading,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "You will recieve an email confirmation",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Color(0xff27272780),
                      ),
                    ),
                    const SizedBox(height: 78),
                    MainButton(
                      text: "See Order details",
                      height: 52,
                      width: .infinity,
                      page: HomePage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

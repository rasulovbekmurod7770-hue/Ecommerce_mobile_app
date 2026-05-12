
import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 71),
          Text(
            "Orders",
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w700,
              color: AppColors.colorBlack,
            ),
          ),
          const SizedBox(height: 204,), 
          Image(image: AssetImage("assets/images/check-out 1.png")), 
          const SizedBox(height: 24,), 
          Text("No Orders yet", style: TextStyle(fontSize: 24, fontWeight: .w500, color: AppColors.colorBlack),), 
          const SizedBox(height: 24,), 
          MainButton(text: "Explore Categories", height: 52, width: 185, page: HomePage())
        ],
      ),
    );
  }
}
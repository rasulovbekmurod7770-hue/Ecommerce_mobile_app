import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: padded(
        Column(
          children: [
            const SizedBox(height: 71),
            Row(
              crossAxisAlignment: .start,
              
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 20,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ),
                
              ],
            ),
            const SizedBox(height: 204),
            Image(image: AssetImage("assets/images/parcel.png")),
            const SizedBox(height: 24),
            Text(
              "Your Cart is Empty",
              style: TextStyle(
                fontSize: 24,
                fontWeight: .w500,
                color: AppColors.colorBlack,
              ),
            ),
            const SizedBox(height: 24),
            MainButton(
              text: "Explore Categories",
              height: 52,
              width: 185,
              page: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:clothing_app_ui/features/profile/widgets/inkwell_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: padded(
        Column(
          children: [
            const SizedBox(height: 129),
            CircleAvatar(
              radius: 40,
              child: Image(image: AssetImage("assets/images/profile.png")),
            ),
            const SizedBox(height: 32),
            Container(
              padding: .only(left: 16, top: 13, right: 16, bottom: 8),
              height: 96,
              width: .infinity,
              decoration: BoxDecoration(
                borderRadius: .circular(8),
                color: AppColors.secondaryColor,
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w700,
                          color: AppColors.colorBlack,
                        ),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w500,
                          color: Color(0xFF272727),
                        ),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w500,
                          color: Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            Column(
              spacing: 8,
              children: [
                inkwell(name: "Address"),
                inkwell(name: "Wishlist"),
                inkwell(name: "Payment"),
                inkwell(name: "Help"),
                inkwell(name: "Support"),
              ],
            ),
            const SizedBox(height: 35,), 
            Text("Sign out", style: TextStyle(fontSize: 16, fontWeight: .w700, color: Color(0xFFFA3636)),), 
          ],
        ),
      ),
    );
  }
}

import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: padded(
        Column(
          crossAxisAlignment: .start,
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
                Text(
                  "Wishlist",
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),

                width: .infinity,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_outline_rounded,
                          size: 24,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Favourite",
                              style: AppTextStyles.secondaryTextBlack,
                            ),
                            const SizedBox(height: 2),
                            Text("12 items", style: AppTextStyles.description),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

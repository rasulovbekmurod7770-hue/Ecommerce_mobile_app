import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class inkwell extends StatelessWidget {
  const inkwell({
    super.key, required this.name
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const .all(16),
        height: 56,
        width: .infinity,
        decoration: BoxDecoration(
          borderRadius: .circular(8),
          color: AppColors.secondaryColor,
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              name,
              style: AppTextStyles.secondaryTextBlack,
            ),
            const Icon(Icons.arrow_forward_ios, size: 24),
          ],
        ),
      ),
    );
  }
}

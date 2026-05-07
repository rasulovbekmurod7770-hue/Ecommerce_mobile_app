import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class Signinwaysbutton extends StatelessWidget {
  Signinwaysbutton({super.key, required this.icon, required this.text, });
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      height: 49,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: .circular(100)
          )
        ),
        onPressed: () {},
        child: Row(
          
          crossAxisAlignment: .start,
          children: [
            Icon(icon, size: 25,),
            const SizedBox(width: 60),
            Text(text, style: AppTextStyles.secondaryTextBlack),
          ],
        ),
      ),
    );
  }
}

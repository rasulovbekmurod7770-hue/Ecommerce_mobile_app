import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    this.onPressed,
  });
  String text;
  double width;
  double height;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: .circular(100)),
        ),
        child: Text(
          text,
          textAlign: .center,
          style: AppTextStyles.secondaryTextWhite,
        ),
      ),
    );
  }
}

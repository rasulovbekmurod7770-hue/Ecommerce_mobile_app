import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({super.key, required this.text, required this.height, required this.width, required this.page});
  String text;
  double width;
  double height;
  Widget page;
  
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
        },

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

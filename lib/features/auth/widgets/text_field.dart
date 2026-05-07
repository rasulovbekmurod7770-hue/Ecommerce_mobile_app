import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class Textfieldforauth extends StatelessWidget {
   Textfieldforauth({
    super.key, required this.hint, 
  });
  String hint;


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
       
        hintText: hint ,
        hintStyle: AppTextStyles.hintText,
        fillColor: AppColors.secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: .none, 
          borderRadius: BorderRadius.circular(4), 
        )
      ),
    );
  }
}
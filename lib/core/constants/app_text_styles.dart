import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles { 
  static const heading = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: .w700,
  );
  static const secondaryTextWhite = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: .w500,
  );
  static const secondaryTextBlack = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: .w500,
  );
  static const hintText = TextStyle(
    color: Color(0xFF27272780),
    fontSize: 16,
    fontWeight: .w500,
  );
  static const nameOfProduct = TextStyle(
    color: AppColors.colorBlack,
    fontSize: 16,
    fontWeight: .w700,
  );
  static const priceOfProduct = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontWeight: .w700,
  );
  static const description = TextStyle(
    color: AppColors.descriptionColor,
    fontSize: 12,
    fontWeight: .w500,
  );
}

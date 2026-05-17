import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Maintextdield extends StatelessWidget {
  const Maintextdield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: .infinity,
      child: TextField(
        decoration: InputDecoration(
          
          prefixIcon: const Icon(CupertinoIcons.search, size: 16),
          hint: Container(
            margin: const .only(top: 10, ),
            child: const Text(
              "Search",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: .w400,
              ),
            ),
          ),
          fillColor: AppColors.secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: .circular(100),
            borderSide: .none,
          ),
        ),
      ),
    );
  }
}

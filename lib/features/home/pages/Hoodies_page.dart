import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoodiesPage extends StatelessWidget {
  const HoodiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: padded(Column(
        children: [
          const SizedBox(height: 63,), 
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
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16,), 
            Text("Hoodies (240)", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: .w700),), 
            const SizedBox(height: 23,), 
            Row(
              children: [
                
              ],
            )
        ],
      )),
    );
  }
}
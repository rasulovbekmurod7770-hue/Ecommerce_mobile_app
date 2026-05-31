import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/widgets/main_widget.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  Favourites({super.key});

  int favouritesCount = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: padded(
        Column(
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
                  child:const  CircleAvatar(
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
                  "My Favourites ($favouritesCount)",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: .w700,
                    color: AppColors.colorBlack,
                  ),
                ),
                const SizedBox(height: 16, width: 16),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 800,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20, 
                  // mainAxisExtent: 20, 
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75
                ),
                itemBuilder: (context, index) => Mainwidget(image: "assets/images/topselling1_image1.png", nameProducta: "nike full Pack", price: 1) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/pages/Hoodies_page.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/listtile.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: padded(
        Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 63),
            Row(
              spacing: 9,
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
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search),
                      hint: Text(
                        "Search",
                        style: TextStyle(fontSize: 12, fontWeight: .w500),
                      ),
                      fillColor: AppColors.secondaryColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: .none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text("Shop by Categories", style: AppTextStyles.heading),
            const SizedBox(height: 14),
            Column(
              spacing: 8,
              children: [
                ListtileW(
                  image: "assets/images/categoryimage1.png",
                  text: "Hoodies",
                  widget: HoodiesPage(),
                ),
                ListtileW(
                  image: "assets/images/categoryimage2.png",
                  text: "Accessories",
                  widget: HomePage(),
                ),
                ListtileW(
                  image: "assets/images/categorimage3.png",
                  text: "Shorts",
                  widget: HomePage(),
                ),
                ListtileW(
                  image: "assets/images/categoryimage4.png",
                  text: "Shoes",
                  widget: HomePage(),
                ),
                ListtileW(
                  image: "assets/images/gategoryimage5.png",
                  text: "Bags",
                  widget: HomePage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

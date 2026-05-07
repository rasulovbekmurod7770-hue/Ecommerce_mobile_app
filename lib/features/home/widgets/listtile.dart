import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListtileW extends StatelessWidget {
   ListtileW({
    super.key,
    required this.image, 
    required this.text, 
    required this.widget
  });
  String image;
  Widget widget;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .only( top: 6),
      height: 64,
      width: .infinity,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: .circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return widget;
          },));
        },
        child: ListTile(
          selectedColor: AppColors.secondaryColor,
          leading: Image(
            image: AssetImage(image),
          ),
          title: Text(text),
        ),
      ),
    );
  }
}

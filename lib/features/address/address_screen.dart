import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/address/add_address.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:clothing_app_ui/features/profile/widgets/inkwell_widget.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
                  child: CircleAvatar(
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
                  "Address",
                  style: TextStyle(
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
              height: 500,
              child: ListView.separated(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: .vertical,
                itemCount: 2,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddress(),));},
                  child: Container(
                    padding: .symmetric(horizontal: 17),
                    width: .infinity,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: .circular(8),
                      color: AppColors.secondaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          "2715 Ash Dr. San Jose, South Dakota 83475",
                          style: AppTextStyles.secondaryTextBlack,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: .w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

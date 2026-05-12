import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddressDetailState();
}

TextEditingController cardNumberController = TextEditingController();
TextEditingController cardHolderNameController = TextEditingController();
TextEditingController ccvController = TextEditingController();
TextEditingController expController = TextEditingController();

class _AddressDetailState extends State<AddCard> {
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
                  "Add Card",
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
              height: 56,
              child: TextFormField(
                keyboardType: .number,

                controller: cardNumberController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: .symmetric(vertical: 23, horizontal: 5),
                  hint: Text("Card Number", style: AppTextStyles.hintText),
                  fillColor: AppColors.secondaryColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: .none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: .spaceBetween,
              // spacing: 20,
              children: [
                SizedBox(
                  width: 131,
                  height: 56,
                  child: TextFormField(
                    keyboardType: .number,
                    controller: ccvController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: .symmetric(vertical: 23, horizontal: 5),
                      hint: Text("CCV", style: AppTextStyles.hintText),
                      fillColor: AppColors.secondaryColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: .none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 131,
                  child: TextFormField(
                    controller: expController,
                    keyboardType: .number,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: .symmetric(vertical: 23, horizontal: 5),
                      hint: Text("Exp", style: AppTextStyles.hintText),
                      fillColor: AppColors.secondaryColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: .none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            SizedBox(
              height: 56,

              child: TextFormField(
                controller: cardHolderNameController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: .symmetric(vertical: 23, horizontal: 5),
                  hint: Text("Cardholder Name", style: AppTextStyles.hintText),
                  fillColor: AppColors.secondaryColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: .none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: .symmetric(vertical: 14),
        height: 80,
        child: padded(
          MainButton(
            text: "Save",
            height: 52,
            width: .infinity,
            page: HomePage(),
          ),
        ),
      ),
    );
  }
}

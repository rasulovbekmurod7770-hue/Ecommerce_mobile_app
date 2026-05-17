import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddressDetailState();
}

TextEditingController streetAdressController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController zipCodeController = TextEditingController();

class _AddressDetailState extends State<AddAddress> {
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
                  child: const CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 20,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ),
                const Text(
                  "Add Address",
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
                controller: streetAdressController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const .symmetric(vertical: 23, horizontal: 5),
                  hint: const Text(
                    "Street Address",
                    style: AppTextStyles.hintText,
                  ),
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
            SizedBox(
              height: 56,

              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const .symmetric(vertical: 23, horizontal: 5),
                  hint: const Text("City", style: AppTextStyles.hintText),
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
                    controller: stateController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const .symmetric(
                        vertical: 23,
                        horizontal: 5,
                      ),
                      hint: const Text("State", style: AppTextStyles.hintText),
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
                    controller: zipCodeController,
                    keyboardType: .number,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const .symmetric(
                        vertical: 23,
                        horizontal: 5,
                      ),
                      hint: const Text(
                        "Zip Code",
                        style: AppTextStyles.hintText,
                      ),
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const .symmetric(vertical: 14),
        height: 80,
        child: padded(
          MainButton(
            text: "Save",
            height: 52,
            width: .infinity,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

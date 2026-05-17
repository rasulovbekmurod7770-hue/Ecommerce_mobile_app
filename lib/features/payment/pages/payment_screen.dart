import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:clothing_app_ui/features/payment/pages/add_card.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: padded(
        Column(
          crossAxisAlignment: .start,
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
            const Text("Cards", style: AppTextStyles.secondaryTextBlack),
            const SizedBox(height: 15),
            SizedBox(
              height: 156,
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddCard()),
                      );
                    },
                    child: Container(
                      padding: const .symmetric(horizontal: 12),
                      width: .infinity,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: .circular(8),
                        color: AppColors.secondaryColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            spacing: 11,
                            children: [
                              Text(
                                "**** 4187",
                                style: AppTextStyles.secondaryTextBlack,
                              ),
                              Image(
                                image: AssetImage("assets/images/paypal.png"),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, size: 24),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            const Text("Paypal", style: AppTextStyles.secondaryTextBlack),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const .symmetric(horizontal: 12),
                width: .infinity,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: AppColors.secondaryColor,
                ),
                child: const Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Cloth@gmail.com",
                      style: AppTextStyles.secondaryTextBlack,
                    ),
                    Icon(Icons.arrow_forward_ios, size: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

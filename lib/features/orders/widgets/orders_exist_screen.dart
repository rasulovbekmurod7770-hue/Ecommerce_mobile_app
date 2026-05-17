import 'package:flutter/material.dart';
import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';

class OrdersExist extends StatefulWidget {
  const OrdersExist({super.key});

  @override
  State<OrdersExist> createState() => _OrdersExistState();
}

class _OrdersExistState extends State<OrdersExist> {
  int selectedIndex = 0;

  final List<String> namesOfTabbar = [
    "Processing",
    "Shipped",
    "Delivered",
    "Returned",
    "Cancelled",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: padded(
        Column(
          children: [
            const SizedBox(height: 71),
            const Text(
              "Orders",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),

            SizedBox(
              height: 30,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: namesOfTabbar.length,
                separatorBuilder: (context, index) => const SizedBox(width: 13),
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        namesOfTabbar[index],
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.colorWhite
                              : AppColors.colorBlack,
                          fontWeight: .w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Order List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.receipt, size: 40, color: Colors.grey),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order #456765",
                              style: AppTextStyles.secondaryTextBlack,
                            ),
                            SizedBox(height: 2),
                            Text("4 items", style: AppTextStyles.description),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
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

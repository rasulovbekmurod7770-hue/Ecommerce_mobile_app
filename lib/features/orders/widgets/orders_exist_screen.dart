import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class OrdersExist extends StatelessWidget {
  OrdersExist({super.key});

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
      scrollDirection: .vertical,
      child: padded(
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            const SizedBox(height: 71),
            Text(
              "Orders",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w700,
                color: AppColors.colorBlack,
              ),
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      scrollDirection: .horizontal,
                      itemCount: namesOfTabbar.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 13),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: .symmetric(horizontal: 8, vertical: 4),
                          height: 27,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: .circular(100),
                          ),
                          child: Text(namesOfTabbar[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) => Container(
                  padding: .symmetric(horizontal: 12, vertical: 15),
                  height: 72,
                  width: .infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: .circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        spacing: 12,
                        children: [
                          Icon(Icons.receipt, size: 40, color: Colors.grey),

                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Order  #456765",
                                style: AppTextStyles.secondaryTextBlack,
                              ),
                              const SizedBox(height: 2),
                              Text("4 items", style: AppTextStyles.description),
                            ],
                          ),
                        ],
                      ),

                      Icon(Icons.arrow_forward_ios),
                    ],
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

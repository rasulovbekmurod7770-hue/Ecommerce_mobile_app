import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

final isDelivered = false;
final isShipped = true;
final isConfirmed = true;
final isPlaced = true;

class _OrderDetailState extends State<OrderDetail> {
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
                  "Order #456765",
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
            ListTile(
              // minLeadingWidth: .infinity,
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: isDelivered
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                child: Icon(
                  Icons.check,
                  size: 8,
                  color: AppColors.backgroundLight,
                ),
              ),
              title: Text(
                "Delivered",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isDelivered
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
              trailing: Text(
                "28 may",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isDelivered
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
            ),
            const SizedBox(height: 51),
            ListTile(
              // minLeadingWidth: .infinity,
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: isShipped
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                child: Icon(
                  Icons.check,
                  size: 8,
                  color: AppColors.backgroundLight,
                ),
              ),
              title: Text(
                "Shipped",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isShipped
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
              trailing: Text(
                "28 may",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isShipped
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
            ),
            const SizedBox(height: 51),
            ListTile(
              // minLeadingWidth: .infinity,
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: isConfirmed
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                child: Icon(
                  Icons.check,
                  size: 8,
                  color: AppColors.backgroundLight,
                ),
              ),
              title: Text(
                "Order Confirmed",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isConfirmed
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
              trailing: Text(
                "28 may",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isConfirmed
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
            ),
            const SizedBox(height: 51),
            ListTile(
              // minLeadingWidth: .infinity,
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: isPlaced
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                child: Icon(
                  Icons.check,
                  size: 8,
                  color: AppColors.backgroundLight,
                ),
              ),
              title: Text(
                "Order Placed",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isPlaced
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
              trailing: Text(
                "28 may",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 16,
                  color: isPlaced
                      ? AppColors.colorBlack
                      : AppColors.descriptionColor,
                ),
              ),
            ),
            const SizedBox(height: 40),

            Text("Order Items", style: AppTextStyles.secondaryTextBlack),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.receipt, size: 40, color: Colors.grey),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order #456765",
                            style: AppTextStyles.secondaryTextBlack,
                          ),
                          const SizedBox(height: 2),
                          Text("4 items", style: AppTextStyles.description),
                        ],
                      ),
                    ],
                  ),
                  const TextButton(
                    onPressed: AboutDialog.adaptive,
                    child: Text(
                      "View All",
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
            const SizedBox(height: 40),
            Text("Shipping details", style: AppTextStyles.secondaryTextBlack),
            const SizedBox(height: 13),
            Container(
              padding: const .all(11),
              width: .infinity,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: .circular(8),
                color: AppColors.secondaryColor,
              ),
              child: Text(
                "2715 Ash Dr. San Jose, South Dakota 83475 \n121-224-7890",
                style: AppTextStyles.secondaryTextBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

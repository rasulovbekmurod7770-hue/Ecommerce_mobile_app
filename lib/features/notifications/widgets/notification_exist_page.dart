import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationExists extends StatelessWidget {
  const NotificationExists({super.key});

  @override
  Widget build(BuildContext context) {
    return padded(
       Column(
        children: [
          const SizedBox(height: 71),
          Center(
            child: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w700,
                color: AppColors.colorBlack,
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => Container(
                padding: .symmetric(horizontal: 12, vertical: 16),
                height: 72,
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: .circular(8),
                ),
                child: Row(
                  spacing: 21,
                  children: [
                    Icon(Icons.notifications, size: 40, color: Colors.grey,),
                    Text(
                      "Gilbert, you placed and order check \nyour order history for full details",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w500,
                        color: AppColors.colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

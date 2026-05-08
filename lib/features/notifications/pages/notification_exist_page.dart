import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class NotificationExistPage extends StatefulWidget {
  const NotificationExistPage({super.key});

  @override
  State<NotificationExistPage> createState() => _NotificationExistPageState();
}

class _NotificationExistPageState extends State<NotificationExistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: padded(
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
            // ListView.separated(
            //   itemCount: ,
            //   separatorBuilder: ,
            //   itemBuilder: ,
            //   )
          ],
        ),
      ),
    );
  }
}

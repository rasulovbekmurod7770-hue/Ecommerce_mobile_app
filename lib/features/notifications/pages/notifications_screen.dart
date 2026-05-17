import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/notifications/widgets/no_notification_screen.dart';
import 'package:clothing_app_ui/features/notifications/widgets/notification_exist_page.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  final bool isNotificationEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: isNotificationEmpty ? const NotificationExists() : const NoNotification(),
    );
  }
}

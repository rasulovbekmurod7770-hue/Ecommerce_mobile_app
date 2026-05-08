import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';

class OrdersExistScreen extends StatefulWidget {
  const OrdersExistScreen({super.key});

  @override
  State<OrdersExistScreen> createState() => _OrdersExistScreenState();
}

class _OrdersExistScreenState extends State<OrdersExistScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  int _selectedindex = 0;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: .vertical,
        child: padded(
          Column(
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
              SizedBox(
                height: 50,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorSize: .tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primaryColor,
                  ),
                  unselectedLabelColor: AppColors.secondaryColor,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(text: "Processing"),
                    Tab(text: "Shipped"),
                    Tab(text: "Delivered"),
                    Tab(text: "Returned"),
                    Tab(text: "Cancelled"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

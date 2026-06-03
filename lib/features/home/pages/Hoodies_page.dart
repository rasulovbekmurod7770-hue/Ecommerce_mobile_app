import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/cubit/product_cubit.dart';
import 'package:clothing_app_ui/features/home/cubit/product_state.dart';
import 'package:clothing_app_ui/features/home/widgets/main_widget.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoodiesPage extends StatefulWidget {
  const HoodiesPage({super.key});

  @override
  State<HoodiesPage> createState() => _HoodiesPageState();
}

class _HoodiesPageState extends State<HoodiesPage> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: padded(
        SingleChildScrollView(
          scrollDirection: .vertical,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 63),
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
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Hoodies",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: .w700,
                ),
              ),
              const SizedBox(height: 23),
              SizedBox(
                height: 2000,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductsLoaded) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 287,
                              
                            ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return Mainwidget(
                            
                            image: product.images[0],
                            nameProducta: product.name,
                            price: product.price,
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

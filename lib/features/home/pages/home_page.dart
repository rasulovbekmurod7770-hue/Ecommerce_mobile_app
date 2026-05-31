import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/widgets/main.textfield.dart';
import 'package:clothing_app_ui/features/home/categories/pages/categories.dart';
import 'package:clothing_app_ui/features/home/cubit/product_cubit.dart';
import 'package:clothing_app_ui/features/home/cubit/product_state.dart';
import 'package:clothing_app_ui/features/home/widgets/circleavatarw.dart';
import 'package:clothing_app_ui/features/home/widgets/main_widget.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:clothing_app_ui/features/home/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 63),
            padded(
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/image.png"),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: DropdownButtonFormField(
                      // isDense: true,
                      decoration: InputDecoration(
                        fillColor: AppColors.secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: .circular(100),
                          borderSide: .none,
                        ),
                      ),
                      items: [
                        const DropdownMenuItem(
                          value: "Men",
                          child: Text(
                            "Men",
                            style: TextStyle(fontSize: 12, fontWeight: .w700),
                          ),
                        ),
                        const DropdownMenuItem(
                          value: "Women",
                          child: Text(
                            "Women",
                            style: TextStyle(fontSize: 12, fontWeight: .w700),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            padded(const Maintextdield()),
            const SizedBox(height: 24),
            padded(
              Texts(
                color: Colors.black,
                text1: "Categories",
                widget: const Categories(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const .only(left: 24),
              child: SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 13.25,
                  crossAxisAlignment: .start,
                  children: [
                    CircleAvatarW(
                      image: "assets/images/categoryimage1.png",
                      text: "Hoodies",
                    ),
                    CircleAvatarW(
                      image: "assets/images/categoryimage2.png",
                      text: "Shorts",
                    ),
                    CircleAvatarW(
                      image: "assets/images/categorimage3.png",
                      text: "Shoes",
                    ),
                    CircleAvatarW(
                      image: "assets/images/categoryimage4.png",
                      text: "Bag",
                    ),
                    CircleAvatarW(
                      image: "assets/images/gategoryimage5.png",
                      text: "Accessories",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            padded(
              Texts(
                color: Colors.black,
                text1: "Top Selling",
                widget: const HomePage(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 281,
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  } else if (state is ProductsLoaded) {
                    return ListView.separated(
                      padding: const EdgeInsets.only(left: 24),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return Mainwidget(
                          image: product.images.isNotEmpty
                              ? product.images[0]
                              : '',
                          nameProducta: product.name,
                          price: product.price,
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            const SizedBox(height: 24),
            padded(
              Texts(
                color: AppColors.primaryColor,
                text1: "New In",
                widget: const HomePage(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 281,
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  } else if (state is ProductsLoaded) {
                    return ListView.separated(
                      padding: const EdgeInsets.only(left: 24),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return Mainwidget(
                          image: product.images.isNotEmpty
                              ? product.images[0]
                              : '',
                          nameProducta: product.name,
                          price: product.price,
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

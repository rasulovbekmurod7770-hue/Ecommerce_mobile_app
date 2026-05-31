import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/home/categories/cubit/categories_cubit.dart';
import 'package:clothing_app_ui/features/home/categories/cubit/categories_state.dart';
import 'package:clothing_app_ui/features/home/pages/Hoodies_page.dart';
import 'package:clothing_app_ui/features/home/widgets/listtile.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    context.read<CategoriesCubit>().getCatergories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is CategoriesError) {
            return Center(child: Text(state.message));
          } else if (state is CategoriesLoaded) {
            return padded(
              Column(
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
                    "Shop by Categories",
                    style: AppTextStyles.heading,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: .vertical,
                      itemCount: state.categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 18),
                      itemBuilder: (context, index) {
                        return ListtileW(
                          image: state.categories[index].imageUrl,
                          text: state.categories[index].name,
                          widget: const HoodiesPage(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

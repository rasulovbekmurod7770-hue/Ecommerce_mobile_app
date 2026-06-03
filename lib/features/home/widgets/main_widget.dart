import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/routes/app_pages.dart';
import 'package:clothing_app_ui/features/product%20page/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mainwidget extends StatefulWidget {
  Mainwidget({
    super.key,
    required this.image,
    required this.nameProducta,
    required this.price,
    
  });

  String image;
  String nameProducta;
  double price;

  @override
  State<Mainwidget> createState() => _MainwidgetState();
}

class _MainwidgetState extends State<Mainwidget> {
  bool onPressed = true;

  void onpressed() {
    setState(() {
      context.watch<ProductModel>().isWishlisted = !context.watch<ProductModel>().isWishlisted;
      onPressed = !onPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 281,
      width: 159,
      color: AppColors.secondaryColor,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            // padding: .only(top: 9, right: 12),
            width: .infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              image: DecorationImage(
                fit: .cover,
                image: NetworkImage(widget.image),
              ),
            ),
            child: Column(
              crossAxisAlignment: .end,
              children: [
                IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    onPressed ? Icons.favorite_outline : Icons.favorite,
                    color: onPressed ? Colors.black : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const .symmetric(horizontal: 4),
            child: Text(
              widget.nameProducta,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: .w400,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const .symmetric(horizontal: 4),
            child: Text(
              "\$${widget.price}",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: .w700,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

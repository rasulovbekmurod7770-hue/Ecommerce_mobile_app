import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/core/provider/cart_provider.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartisNotEmpty extends StatefulWidget {
  const CartisNotEmpty({super.key});

  @override
  State<CartisNotEmpty> createState() => _CartisNotEmptyState();
}

class _CartisNotEmptyState extends State<CartisNotEmpty> {
 
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return padded(
      Column(
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
                "Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w700,
                  color: AppColors.colorBlack,
                ),
              ),
              const SizedBox(height: 16, width: 16),
            ],
          ),
          const SizedBox(height: 34),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const SizedBox(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Remove All",
                  style: AppTextStyles.secondaryTextBlack,
                  textAlign: .end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const .symmetric(horizontal: 8, vertical: 8),
            height: 80,
            width: .infinity,
            decoration: BoxDecoration(color: AppColors.secondaryColor),
            child: Row(
              children: [
                SizedBox(
                  width: 64,
                  height: 64,
                  child: Image(
                    fit: .cover,
                    image: AssetImage("assets/images/topsellingi1.png"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const .symmetric(vertical: 6.5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Men's Harrington Jacket",
                              style: TextStyle(
                                fontWeight: .w500,
                                fontSize: 12,
                                color: AppColors.colorBlack,
                              ),
                            ),
                            Text(
                              "\$${cart.priceOfJacket}",
                              style: TextStyle(
                                fontWeight: .w700,
                                fontSize: 12,
                                color: AppColors.colorBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Row(
                              spacing: 3,
                              children: [
                                Text("size", style: AppTextStyles.description),
                                Text(
                                  "- M",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: .w500,
                                    color: AppColors.colorBlack,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 3,
                              children: [
                                Text("color", style: AppTextStyles.description),
                                Text(
                                  "- Black",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: .w500,
                                    color: AppColors.colorBlack,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 23,
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: AppColors.primaryColor,
                                  child: IconButton(
                                    onPressed: () {
                                      context.read<CartProvider>().addButton();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.colorWhite,
                                      size: 6,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${cart.productCount}",
                                  style: TextStyle(
                                    color: AppColors.colorBlack,
                                    fontSize: 16,
                                    fontWeight: .w500,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: AppColors.primaryColor,
                                  child: IconButton(
                                    onPressed: () {
                                      if (cart.productCount > 1) {
                                        context.read<CartProvider>().minusButton();
                                      } else {
                                        null;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: AppColors.colorWhite,
                                      size: 6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 170),
          Column(
            spacing: 12,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w500,
                      color: Color(0xFF27272780),
                    ),
                  ),
                  Text("\$${cart.subtotal}"),
                ],
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Shipping Cost",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w500,
                      color: Color(0xFF27272780),
                    ),
                  ),
                  Text("\$${cart.shippingCost}"),
                ],
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Tax",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w500,
                      color: Color(0xFF27272780),
                    ),
                  ),
                  Text("\$${cart.tax}"),
                ],
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w500,
                      color: Color(0xFF27272780),
                    ),
                  ),
                  Text("\$${cart.total}"),
                ],
              ),
              const SizedBox(height: 19),
              Container(
                padding: const .all(8),
                height: 56,
                width: .infinity,
                decoration: BoxDecoration(color: AppColors.secondaryColor, borderRadius:  .circular(8)),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Container(
                      margin: .only(left: 8, top: 8, bottom: 8),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(Icons.countertops_outlined, size: 24, color: Color(0xFF5FB567),),
                          Text(
                            "Enter Coupon Code",
                            style: TextStyle(fontSize: 12, fontWeight: .w500, color: AppColors.descriptionColor),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 20,
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

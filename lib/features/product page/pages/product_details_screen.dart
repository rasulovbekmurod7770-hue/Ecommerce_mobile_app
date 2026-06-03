import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:clothing_app_ui/features/product%20page/cubit/products_cubit.dart';
import 'package:clothing_app_ui/features/product%20page/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool oNpressed = true;
  void onpressed() {
    setState(() {
      oNpressed = !oNpressed;
    });
  }

  int productCount = 1;
  Map<String, Color> colors = {
    "Orange": Colors.orange,
    "Black": Colors.black,
    "Red": Colors.red,
    "Yellow": Colors.yellow,
    "Blue": Colors.blue,
  };

  bool ontapped = true;

  List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keys = colors.keys.toList();
    final values = colors.values.toList();
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        scrollDirection: .vertical,
        child: padded(
          Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 63),
              Row(
                mainAxisAlignment: .spaceBetween,

                // spacing: 9,
                children: [
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
                  InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.secondaryColor,
                      radius: 20,
                      child: IconButton(
                        onPressed: onpressed,
                        icon: Icon(
                          oNpressed ? Icons.favorite_outline : Icons.favorite,
                          color: oNpressed ? Colors.black : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
               SizedBox(
                height: 248,
                child: SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      Image(
                        width: 161,
                        height: 248,
                        image: NetworkImage(widget.product.images.first),
                      ),
                      Image(
                        width: 161,
                        height: 248,
                        image: NetworkImage(widget.product.images.first),
                      ),
                      Image(
                        width: 161,
                        height: 248,
                        fit: .fitHeight,
                        image: NetworkImage(widget.product.images.last),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
               Text(
                widget.product.name,
                style: AppTextStyles.nameOfProduct,
              ),
              const SizedBox(height: 15),
               Text("\$${widget.product.price}", style: AppTextStyles.priceOfProduct),
              const SizedBox(height: 33),
              Container(
                padding: const .only(left: 16),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: .circular(100),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text("Size", style: AppTextStyles.secondaryTextBlack),
                    SizedBox(
                      height: 56,
                      width: 50,
                      child: InkWell(
                        borderRadius: .circular(100),
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: AppColors.backgroundLight,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 2,
                                child: SingleChildScrollView(
                                  scrollDirection: .vertical,
                                  child: padded(
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment: .center,
                                      children: [
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          mainAxisSize: .max,
                                          children: [
                                            const SizedBox(width: 24),
                                            const Text(
                                              "Colors",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: .w700,
                                                color: AppColors.colorBlack,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.check,
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 28),
                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            print("b $ontapped");
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                            print("a $ontapped");
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[0],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.check,
                                                  color: AppColors.colorBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[1],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.check,
                                                  color: AppColors.colorBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[2],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.check,
                                                  color: AppColors.colorBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[3],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.check,
                                                  color: AppColors.colorBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[4],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.check,
                                                  color: AppColors.colorBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(CupertinoIcons.arrow_down),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const .only(left: 16),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: .circular(100),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text(
                      "Color",
                      style: AppTextStyles.secondaryTextBlack,
                    ),
                    SizedBox(
                      height: 56,
                      width: 50,
                      child: InkWell(
                        borderRadius: .circular(100),
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: AppColors.backgroundLight,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 2,
                                child: SingleChildScrollView(
                                  scrollDirection: .vertical,
                                  child: padded(
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment: .center,
                                      children: [
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          mainAxisSize: .max,
                                          children: [
                                            const SizedBox(width: 24),
                                            const Text(
                                              "Colors",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: .w700,
                                                color: AppColors.colorBlack,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.check,
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 28),
                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            print("b $ontapped");
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                            print("a $ontapped");
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[0],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: values[0],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[1],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: values[1],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[2],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: values[2],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  widget.product.sizes[3],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: values[3],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        InkWell(
                                          borderRadius: .circular(100),
                                          onTap: () {
                                            setState(() {
                                              ontapped = !ontapped;
                                            });
                                          },
                                          child: Container(
                                            padding: const .symmetric(
                                              horizontal: 16,
                                            ),
                                            width: .infinity,
                                            height: 56,
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(100),
                                              color: ontapped
                                                  ? AppColors.secondaryColor
                                                  : AppColors.primaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: .spaceBetween,
                                              children: [
                                                Text(
                                                  keys[4],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: .w500,
                                                    color: AppColors.colorBlack,
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: values[4],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(CupertinoIcons.arrow_down),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const .symmetric(horizontal: 16),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: .circular(100),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    const Text(
                      "Quantity",
                      style: AppTextStyles.secondaryTextBlack,
                    ),
                    Row(
                      spacing: 23,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                productCount++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ),
                        Text(
                          "$productCount",
                          style: const TextStyle(
                            color: AppColors.colorBlack,
                            fontSize: 16,
                            fontWeight: .w500,
                          ),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              if (productCount > 1) {
                                setState(() {
                                  productCount--;
                                });
                              } else {
                                null;
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                "Built for life and made to last, this full-zip corduroy jacket is \npart of our Nike Life collection. The spacious fit gives you \nplenty of room to layer underneath, while the soft corduroy \nkeeps it casual and timeless.",
                style: AppTextStyles.description,
              ),
              const SizedBox(height: 24),
              const Text(
                "Shipping & Returns",
                style: AppTextStyles.nameOfProduct,
              ),
              const SizedBox(height: 12),
              const Text(
                "Free standard shipping and free 60-day returns",
                style: AppTextStyles.description,
              ),
              const SizedBox(height: 24),
              const Text("Reviews", style: AppTextStyles.nameOfProduct),
              const SizedBox(height: 12),
              const Text(
                "4.5 Ratings",
                style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 24,
                  fontWeight: .w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text("213 Reviews", style: AppTextStyles.description),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return const Column(
                    crossAxisAlignment: .start,
                    children: [
                      ListTile(
                        // contentPadding: .symmetric(),
                        leading: CircleAvatar(
                          radius: 20,
                          child: Image(
                            image: AssetImage("assets/images/alexMorgan.png"),
                          ),
                        ),
                        title: Text(
                          "Alex Morgan",
                          style: TextStyle(fontSize: 12, fontWeight: .w700),
                        ),
                        trailing: Image(
                          image: AssetImage("assets/images/3stars.png"),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Gucci transcribes its heritage, creativity, and innovation into a \nplenitude of collections. From staple items to distinctive \naccessories.",
                        style: AppTextStyles.description,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "12 days ago",
                        style: TextStyle(
                          color: AppColors.colorBlack,
                          fontSize: 12,
                          fontWeight: .w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const .symmetric(vertical: 14),
        height: 80,
        child: padded(
          MainButton(
            text: "Add to bag",
            height: 52,
            width: .infinity,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

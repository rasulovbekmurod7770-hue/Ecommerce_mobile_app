import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/constants/app_text_styles.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/home/widgets/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
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
                    child: CircleAvatar(
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
                        image: AssetImage(
                          "assets/images/topselling1_image1.png",
                        ),
                      ),
                      Image(
                        width: 161,
                        height: 248,
                        image: AssetImage(
                          "assets/images/topselling1_image2.png",
                        ),
                      ),
                      Image(
                        width: 161,
                        height: 248,
                        fit: .fitHeight,
                        image: AssetImage(
                          "assets/images/topselling1_image3.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Men's Harrington Jacket",
                style: AppTextStyles.nameOfProduct,
              ),
              const SizedBox(height: 15),
              Text("\$148", style: AppTextStyles.priceOfProduct),
              const SizedBox(height: 33),
              Container(
                padding: .only(left: 16),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: .circular(100),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Size", style: AppTextStyles.secondaryTextBlack),
                    SizedBox(
                      height: .infinity,
                      width: 100,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(bottom: 30),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: .circular(100),
                            borderSide: .none,
                          ),
                        ),

                        items: [
                          DropdownMenuItem(
                            value: "S",
                            child: Text(
                              "S",
                              style: TextStyle(fontSize: 12, fontWeight: .w700),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "M",
                            child: Text(
                              "M",
                              style: TextStyle(fontSize: 12, fontWeight: .w700),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "L",
                            child: Text(
                              "L",
                              style: TextStyle(fontSize: 12, fontWeight: .w700),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: .only(left: 16),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: .circular(100),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Color", style: AppTextStyles.secondaryTextBlack),
                    SizedBox(
                      height: .infinity,
                      width: 100,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(bottom: 30),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: .circular(100),
                            borderSide: .none,
                          ),
                        ),

                        items: [
                          DropdownMenuItem(
                            value: "colorLemon",
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0xFFB3B68B),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "M",
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "L",
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: .symmetric(horizontal: 16),
                width: .infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: .circular(100),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Color", style: AppTextStyles.secondaryTextBlack),
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
                            icon: Icon(Icons.add, color: AppColors.colorWhite),
                          ),
                        ),
                        Text(
                          "$productCount",
                          style: TextStyle(
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
                            icon: Icon(
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
              Text(
                "Built for life and made to last, this full-zip corduroy jacket is \npart of our Nike Life collection. The spacious fit gives you \nplenty of room to layer underneath, while the soft corduroy \nkeeps it casual and timeless.",
                style: AppTextStyles.description,
              ),
              const SizedBox(height: 24),
              Text("Shipping & Returns", style: AppTextStyles.nameOfProduct),
              const SizedBox(height: 12),
              Text(
                "Free standard shipping and free 60-day returns",
                style: AppTextStyles.description,
              ),
              const SizedBox(height: 24),
              Text("Reviews", style: AppTextStyles.nameOfProduct),
              const SizedBox(height: 12),
              Text(
                "4.5 Ratings",
                style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 24,
                  fontWeight: .w700,
                ),
              ),
              const SizedBox(height: 12),
              Text("213 Reviews", style: AppTextStyles.description),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Column(
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
                      const SizedBox(height: 4),
                      Text(
                        "Gucci transcribes its heritage, creativity, and innovation into a \nplenitude of collections. From staple items to distinctive \naccessories.",
                        style: AppTextStyles.description,
                      ),
                      const SizedBox(height: 4),
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
        padding: .symmetric(vertical: 14),
        height: 80,
        child: padded(
          MainButton(
            text: "Add to bag",
            height: 52,
            width: .infinity,
            page: HomePage(),
          ),
        ),
      ),
    );
  }
}

import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:flutter/material.dart';

class TellUsAbtYourself extends StatefulWidget {
  const TellUsAbtYourself({super.key});

  @override
  State<TellUsAbtYourself> createState() => _TellUsAbtYourselfState();
}

class _TellUsAbtYourselfState extends State<TellUsAbtYourself> {
  bool onTapped2 = false;
  bool onTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const SizedBox(height: 161),
            const Text(
              "Tell us About yourself",
              style: TextStyle(fontSize: 24, fontWeight: .w700),
            ),
            const SizedBox(height: 49),
            const Text(
              "Who do you shop for ?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              spacing: 20,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  
                  onTap: () {
                    setState(() {
                      onTapped = true;
                      onTapped2 = false;
                    });
                  },
                  child: Container(
                    padding: const .only(top: 12),
                    height: 52,
                    width: 161,
                    decoration: BoxDecoration(
                      color: onTapped
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                      borderRadius: .circular(100),
                    ),
                    child: Text(
                      "Men",
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w400,
                        color: onTapped ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    setState(() {
                      onTapped2 = true;
                      onTapped = false;
                    });
                  },
                  child: Container(
                    padding: const .only(top: 12),
                    height: 52,
                    width: 161,
                    decoration: BoxDecoration(
                      color: onTapped2
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                      borderRadius: .circular(100),
                    ),
                    child: Text(
                      "Women",
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w400,
                        color: onTapped2 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 56),
            const Text(
              "How Old are you ?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 13),
            SizedBox(
              height: 56,
              width: .infinity,
              child: DropdownButtonFormField(
                hint: const Text("Age range"),

                decoration: InputDecoration(
                  fillColor: AppColors.secondaryColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: .none,
                    borderRadius: .circular(100),
                  ),
                ),
                items: [
                  const DropdownMenuItem(value: "1-18", child: Text("1-18")),
                  const DropdownMenuItem(value: "18-25", child: Text("18-25")),
                  const DropdownMenuItem(value: "25+", child: Text("25+")),
                ],
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: AppColors.secondaryColor,
        child: Padding(
          padding: const .symmetric(horizontal: 24, vertical: 14),
          child: MainButton(
            text: "finish",
            height: 52,
            width: .infinity,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

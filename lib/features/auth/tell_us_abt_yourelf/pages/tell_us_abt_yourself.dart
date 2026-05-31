import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/core/routes/app_pages.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/user_dto.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/cubit/user_cubit.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/cubit/user_state.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TellUsAbtYourself extends StatefulWidget {
  final int userId;
  const TellUsAbtYourself({super.key, required this.userId});

  @override
  State<TellUsAbtYourself> createState() => _TellUsAbtYourselfState();
}

class _TellUsAbtYourselfState extends State<TellUsAbtYourself> {
  bool onTapped2 = false;
  bool onTapped = false;

  String? selectedGender;
  String? selectedAge;

  static const List<String> _ageRanges = [
    "under 18",
    "18-24",
    "25-34",
    "35+",
  ];

  void _onFinish(BuildContext context) {
    if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select who you shop for")),
      );
      return;
    }
    if (selectedAge == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select your age range")),
      );
      return;
    }
    context.read<UserCubit>().getDetails(
          widget.userId,
          UserDto(gender: selectedGender!, age: selectedAge!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppPages.homePage,
            (route) => false,
          );
        } else if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 161),
                  const Text(
                    "Tell us About yourself",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 49),
                  const Text(
                    "Who do you shop for ?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
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
                            selectedGender = "man";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 12),
                          height: 52,
                          width: 161,
                          decoration: BoxDecoration(
                            color: onTapped
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "Men",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
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
                            selectedGender = "woman";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 12),
                          height: 52,
                          width: 161,
                          decoration: BoxDecoration(
                            color: onTapped2
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "Women",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
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
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 13),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedAge,
                      hint: const Text("Age range"),
                      decoration: InputDecoration(
                        fillColor: AppColors.secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      items: _ageRanges
                          .map((range) => DropdownMenuItem(
                                value: range,
                                child: Text(range),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedAge = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: AppColors.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return MainButton(
                  text: state is UserLoading ? "Loading..." : "Finish",
                  height: 52,
                  width: double.infinity,
                  onPressed: state is UserLoading ? () {} : () => _onFinish(context),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

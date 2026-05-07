import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  Texts({super.key, required this.color, required this.text1, required this.widget});
  String text1;
  Color color;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 16, fontWeight: .w700, color: color),
        ),

        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return widget;
                },
              ),
            );
          },
          child: Text(
            "See all",
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

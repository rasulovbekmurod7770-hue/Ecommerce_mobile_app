import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleAvatarW extends StatelessWidget {
   CircleAvatarW({
    super.key, required this.image, required this.text
  });
 String image; 
 String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          child: Image(image: AssetImage(image)),
        ), 
        const SizedBox(height: 5,), 
        Text(text, style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: .w400),)
      ],
    );
  }
}

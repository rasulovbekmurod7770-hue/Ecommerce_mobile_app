import 'package:clothing_app_ui/features/auth/pages/sign_in_page.dart';
import 'package:clothing_app_ui/features/auth/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordSucces extends StatelessWidget {
  const ResetPasswordSucces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: const .symmetric(horizontal: 24), 
      child: Column(
        crossAxisAlignment: .center,
        children: [
          const SizedBox(height: 292,), 
          const SizedBox(
            height: 100,
            width: 100,
            child: Image(image: AssetImage("assets/images/success.png"))), 
          const SizedBox(height: 24,), 
          const Text(
            "We Sent you an Email to reset \nyour password.", style: TextStyle(fontSize: 24, fontWeight: .w500, color: Colors.black),textAlign: .center,), 
          const SizedBox(height: 24,), 
          MainButton(text: "Return to Login", height: 52, width: 159, 
            onPressed: () {},)
        ],
      ),
      
      ) ,
    );
  }
}
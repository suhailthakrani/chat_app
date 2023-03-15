import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Card(
        margin: EdgeInsets.only(top: 76),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/animals.jpg',
            width: 76,
            height: 76,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _buildSignInWidget() {
      return Container(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign in with Social Networks",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  controller.handleSignIn();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Google Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _buildSignInWidget(),
          ],
        ),
      ),
    );
  }
}

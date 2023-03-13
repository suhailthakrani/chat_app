import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Card(
        margin: EdgeInsets.only(top: 76.h),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/animals.jpg',
            width: 76.w,
            height: 76.h,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _buildSignInWidget() {
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(
          top: 80.h,
        ),
        child: Column(
          children: [
            Text(
              "Sign in with Social Networks",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                height: 1,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 55.h,
              width: 250.w,
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
                    fontSize: 16.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              _buildLogo(),
              Spacer(),
              _buildSignInWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

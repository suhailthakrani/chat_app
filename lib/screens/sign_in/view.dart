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
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(
          top: 80.h,
        ),
        child: Column(
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              margin: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(),
                          ],
                          borderRadius: BorderRadius.circular(35)),
                      width: 80.w,
                      child: Image.asset('assets/images/animals.jpg'),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      'assets/images/animals.jpg',
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
          ],
        ),
      ),
    );
  }
}

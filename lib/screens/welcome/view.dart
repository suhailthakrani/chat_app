

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SizedBox(
        height: 780.h,
        width: 360.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (value) {
                // 
              },
              controller: PageController(
                initialPage: 0,
                keepPage: false,
                viewportFraction: 1,

              ),
              pageSnapping: false,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/'))
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
} 

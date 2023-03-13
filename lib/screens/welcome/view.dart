import 'package:chat_app/screens/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SizedBox(
        height: 780.h,
        width: 360.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index) {
                controller.changePage(index);
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/test1.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/test2.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/test3.jpeg'),
                        fit: BoxFit.fill),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 85,
                        left: 30,
                        right: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.signIn();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: Text("Login"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 70,
              child: DotsIndicator(
                dotsCount: 3,
                position: controller.state.index.value.toDouble(),
                mainAxisAlignment: MainAxisAlignment.center,
                reversed: false,
                decorator: DotsDecorator(
                  size: Size.square(9),
                  activeSize: const Size(18, 9),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

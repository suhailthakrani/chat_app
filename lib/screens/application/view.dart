import 'package:chat_app/screens/application/controller.dart';
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ApplicationScreen extends GetView<ApplicationController> {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          Center(
              child: Container(
            child: Text("Chat"),
          )),
          Center(
              child: Container(
            child: Text("Contact"),
          )),
          Center(
              child: Container(
            child: Text("Profile"),
          )),
        ],
      );
    }

    Widget _buildBottomNavigation() {
      return Obx(
        () => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.state.page,
          type: BottomNavigationBarType.fixed,
          onTap: controller.onNavBarTap,
        ),
      );
    }

    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}

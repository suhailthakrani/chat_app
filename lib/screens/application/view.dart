import 'package:chat_app/screens/application/controller.dart';
import 'package:chat_app/screens/message/view.dart';
import 'package:chat_app/screens/profile/view.dart';
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/sign_in/index.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../contacts/index.dart';

class ApplicationScreen extends GetView<ApplicationController> {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
      
        children: const [
          MessageScreen(),
          ContactsScreen(),
          ProfileScreen(),
        ],
      );
    }

    Widget _buildBottomNavigation() {
      return BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controller.onNavBarTap,
      );
    }

    return Obx(() => Scaffold(
          body: _buildPageView(),
          bottomNavigationBar: _buildBottomNavigation(),
        ));
  }
}

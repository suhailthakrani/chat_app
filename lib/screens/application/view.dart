import 'package:chat_app/screens/application/controller.dart';
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          Center(
              child: Container(
            child: Text("Chat"),
          )),
          ContactsScreen(),
          Center(
              child: Container(
            child: GestureDetector(
                onTap: () {
                  UserStore.to.onLogOut();

                  FirebaseAuth.instance.signOut();
                },
                child: Text("Profile")),
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

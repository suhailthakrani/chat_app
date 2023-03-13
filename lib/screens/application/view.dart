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
    return Scaffold(
        body: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("data"),
        );
      },
    ));
  }
}

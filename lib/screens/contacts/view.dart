import 'package:chat_app/screens/application/controller.dart';
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'index.dart';

class ContactsScreen extends GetView<ContactsController> {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Center(child: Text('Contacts '),),);
  }
}

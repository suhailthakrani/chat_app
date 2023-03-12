

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome Screen"),
      ),
    );
  }
} 

import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Card(
        margin: EdgeInsets.only(top: 76),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: AssetImage(
              'assets/images/chat.png',
            ),
            width: 76,
            height: 76,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _buildSignInWidget() {
      return Container(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 55,
              width: 250,
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
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          children: [
            // _buildLogo(),
            Spacer(),
            _buildTextField(
              label: 'Email',
              icon: Icons.email,
              onChanged: (value) {
                //
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildTextField(
              label: 'Password',
              icon: Icons.lock,
              onChanged: (value) {
                //
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                controller.signInWithEmailAndPassword('hello@gmail.com', '12345678');
              },
              child: Text('Continue with Email'),
            ),
            _buildSignInWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required Function(String) onChanged,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}

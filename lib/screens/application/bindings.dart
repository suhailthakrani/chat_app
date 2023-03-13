
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/controller.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }

}
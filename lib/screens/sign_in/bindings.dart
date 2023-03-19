
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:get/get.dart';

class SignInBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }

}
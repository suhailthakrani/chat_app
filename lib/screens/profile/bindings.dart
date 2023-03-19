
import 'package:chat_app/screens/message/controller.dart';
import 'package:chat_app/screens/profile/controller.dart';
import 'package:get/get.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(()=>ProfileController());
  }
}
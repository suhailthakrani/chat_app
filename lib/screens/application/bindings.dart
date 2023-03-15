
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/sign_in/controller.dart';
import 'package:chat_app/screens/welcome/controller.dart';
import 'package:get/get.dart';

import '../contacts/index.dart';
import '../message/chat/index.dart';

class ApplicationBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
     Get.lazyPut<ContactsController>(() => ContactsController());
     Get.lazyPut<ChatController>(()=>ChatController());
  }

}
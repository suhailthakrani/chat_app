import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/contacts/controller.dart';
import 'package:chat_app/screens/message/components/chat/controller.dart';
import 'package:chat_app/screens/message/controller.dart';
import 'package:chat_app/screens/profile/controller.dart';



class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());

    Get.lazyPut<ContactsController>(() => ContactsController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}

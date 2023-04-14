import 'package:chat_app/screens/message/controller.dart';
import 'package:get/get.dart';

class MessageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}

import 'index.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(ChatController());
  }
}

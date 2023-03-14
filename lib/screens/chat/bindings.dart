

import 'index.dart';

class ChatBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }

}
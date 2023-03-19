import 'package:chat_app/screens/message/components/photoview/index.dart';

class PhotoViewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoViewImageController>(() => PhotoViewImageController());
  }
}

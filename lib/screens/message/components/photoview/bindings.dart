import 'index.dart';

class PhotoViewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoViewImageController>(() => PhotoViewImageController());
  }
}

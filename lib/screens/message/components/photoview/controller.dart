
import 'package:chat_app/common/store/user_store.dart';

import 'index.dart';

class PhotoViewImageController extends GetxController {
  PhotoViewImageController();
  final PhotoViewState state = PhotoViewState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onInit() {
    
    super.onInit();
    var data = Get.parameters;
    if (data['imgUrl'] != null) {
      state.imgUrl.value = data['imgUrl']!;
    }
  }
  
  
}

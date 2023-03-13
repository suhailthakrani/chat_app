import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/screens/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  
  WelcomeController();
  final state = WelcomeState();

  changePage(int index) async{
    state.index.value = index;
  }
  signIn() {
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/screens/sign_in/state.dart';
import 'package:chat_app/screens/welcome/state.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  
  SignInController();
  final state = SignInState();

  changePage(int index) async{
    state.index.value = index;
  }
  signIn() async {
    //
    // await ConfigStrore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
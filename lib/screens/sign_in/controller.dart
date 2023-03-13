import 'package:chat_app/common/entities/user_model.dart';
import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/common/store/config.dart';
import 'package:chat_app/screens/sign_in/state.dart';
import 'package:chat_app/screens/welcome/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user_store.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String> [
    'openid'
  ]
);

class SignInController extends GetxController {
  
  SignInController();
  final state = SignInState();
  //
  final db = FirebaseFirestore.instance;

  changePage(int index) async{
    state.index.value = index;
  }
  signIn() async {
    //
    await ConfigStrore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null ) {
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? '';
        UserModel userProfile = UserModel(displayName: displayName, email: email, id: id, photoUrl: photoUrl);
        UserStore.to.saveProfile(userProfile);
      }
    } catch (e) {
      
    }
  }
}
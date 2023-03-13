

import '../../common/entities/user_data.dart';
import '../../common/entities/user_model.dart';
import 'index.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class ApplicationController extends GetxController {
  ApplicationController();
  final state = SignInState();
  //
  final db = FirebaseFirestore.instance;

  changePage(int index) async {
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
      if (user != null) {
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? '';
        UserModel userProfile = UserModel(
            displayName: displayName, email: email, id: id, photoUrl: photoUrl);
        UserStore.to.saveProfile(userProfile);

        var userbase = await db
            .collection('users')
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userData, options) {
                return userData.toFirestore();
              },
            )
            .where('id', isEqualTo: user.id)
            .get();
        if (userbase.docs.isEmpty) {
          final data = UserData(
            id: id,
            displayName: displayName,
            email: email,
            photoUrl: photoUrl,
            location: '',
            fcmToken: '',
            addTime: Timestamp.now(),
          );
          var userbase = await db
              .collection('users')
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userData, options) {
                  return userData.toFirestore();
                },
              )
              .add(data);
        }
        toastInfo(message: 'login success');
        Get.offAndToNamed(AppRoutes.Application);
      }
    } catch (e) {
      print(e.toString());
      toastInfo(message: 'login failed');
    }
  }
}

Future<bool?> toastInfo({
  required String message,
  Color backgraoundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgraoundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}

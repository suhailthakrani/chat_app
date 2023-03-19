import 'package:chat_app/screens/sign_in/index.dart';
import 'package:firebase_auth/firebase_auth.dart';



GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();
  //
  final db = FirebaseFirestore.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  changePage(int index) async {
    state.index.value = index;
  }

  signIn() async {
    //
    await ConfigStrore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.Application);
  }

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {

        final gAuthentication = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: gAuthentication.idToken,
          accessToken: gAuthentication.accessToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? '';
        UserModel userProfile = UserModel(
            displayName: displayName, email: email, accessToken: id, photoUrl: photoUrl);
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
        signIn();
      }
    } catch (e) {
      print(e.toString());
      toastInfo(message: 'login failed');
    }
  }
  Future<void> signUp() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    User? user = userCredential.user;
    // do something with the user object
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> signInWithEmailAndPassword() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    User? user = userCredential.user;
    // do something with the user object
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
}


  // Check whether user is already logged in or not
  @override
  void onReady() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently logged out.');
      } else {
        print('User is logged in');
      }
    });
    super.onReady();
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
    fontSize: 16,
  );
}

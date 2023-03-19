
import 'dart:convert';

import 'package:chat_app/common/entities/me_list_item.dart';
import 'package:chat_app/common/entities/message_data.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/message/state.dart';
import 'package:chat_app/screens/profile/state.dart';
import 'package:chat_app/screens/sign_in/index.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:location/location.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileController extends GetxController {
  ProfileController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final ProfileState state = ProfileState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'http://www.gogleapis.com/auth/contacts.readonly'
    ]
  );

  final ProfileState profileState = ProfileState();
  loadAllData() async {
    String profile = await UserStore.to.getProfile();
    if (profile.isNotEmpty) {
      UserModel userModel = UserModel.fromMap(jsonDecode(profile));
      state.head_detail.value = userModel;
    }
  }


  Future<void> logout() async {
    UserStore.to.onLogOut();
    await _googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  @override
  void onInit() {
    
    
    super.onInit();
    loadAllData();
    List<Map<String, dynamic>> myList = [
      {"name":"Account", "icon": 'assets/images/profile.png', "route": "/account", },
      {"name":"Chat", "icon": 'assets/images/profile.png', "route": "/chat", },
      {"name":"Notification", "icon": 'assets/images/profile.png', "route": "/notification", },
      {"name":"Privacy", "icon": 'assets/images/profile.png', "route": "/privacy", },
      {"name":"Help", "icon": 'assets/images/profile.png', "route": "/help", },
      {"name":"About", "icon": 'assets/images/profile.png', "route": "/about", },
      {"name":"Logout", "icon": 'assets/images/profile.png', "route": "/logout", },
    ];


    for (var result in myList) {
      state.meListItem.add(MeListItem.fromMap(result),);
    }
  }
 
}


import 'dart:convert';

import 'package:chat_app/common/services/storage.dart';
import 'package:chat_app/common/values/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../entities/user_model.dart';

class UserStore extends GetxController {
  String token = '';
  final _isLogin = false.obs;
  final _profile = UserModel().obs;

  bool get isLogin => _isLogin.value;
  UserModel get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  static UserStore get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var offlineProfile = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (offlineProfile.isNotEmpty) {
      _isLogin.value = true;
      _profile(
        UserModel.fromJson(
          jsonDecode(offlineProfile),
        ),
      );
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(USER_STORAGE_TOKEN_KEY, value);
    token = value;
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return '';
    String key = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    String finalKey = key.replaceAll('\\', '');
    return finalKey.substring(1, finalKey.length - 1);
  }

  saveProfile(UserModel user) {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(user));

    setToken(user.accessToken!);
  }

  Future<void> onLogOut() async {
    await StorageService.to.remove(USER_STORAGE_TOKEN_KEY);
    await StorageService.to.remove(USER_STORAGE_TOKEN_KEY);
    _isLogin.value = false;
  }
}

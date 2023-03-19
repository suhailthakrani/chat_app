import 'dart:io';

import 'package:chat_app/common/services/storage.dart';
import 'package:chat_app/common/values/storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:packages_info/packages_info.dart';

class ConfigStrore extends GetxController {
  static ConfigStrore get to => Get.find();

  bool isFirstOpen = false;
  static Platform? _platform;
  static String get version => Platform.version;
  bool get isRelease => bool.fromEnvironment("dart.vm.product");
  Locale locale = Locale('en', 'US');
  List<Locale> languages = [
    Locale('en', 'US'),
    Locale('en', 'US'),
  ];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  }

  //
  Future<void> getPlatform() async {
    _platform = Platform();
  }

  //
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }

  //
  void onInitLocale() {
    var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(STORAGE_LANGUAGE_CODE, value.languageCode);
  }
}

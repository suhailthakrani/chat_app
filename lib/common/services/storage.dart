import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  late final SharedPreferences _preferences;


  Future<StorageService> init() async  {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> remove(String key)   async {
    return await _preferences.remove(key);
  }
  Future<bool> setString(String key, String value)   async {
    return await _preferences.setString(key, value);
  }
 
  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }
 
   Future<bool> setList(String key, List<String> value)   async {
    return await _preferences.setStringList(key, value);
  }
    bool getBool(String key) {
    return  _preferences.getBool(key) ?? false;
  }
   String getString(String key) {
    return  _preferences.getString(key) ?? '';
  }
   List<String> getStringList(String key)  {
    return  _preferences.getStringList(key) ?? [];
  }
}
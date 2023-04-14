import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/common/routes/pages.dart';
import 'package:chat_app/common/services/storage.dart';
import 'package:chat_app/common/store/config.dart';
import 'package:chat_app/common/store/user_store.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/application/controller.dart';
import 'package:chat_app/screens/message/controller.dart';
import 'package:chat_app/screens/welcome/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());

  Get.put<ConfigStrore>(ConfigStrore());

  Get.put(WelcomeController());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

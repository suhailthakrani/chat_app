import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/common/routes/observers.dart';
import 'package:chat_app/screens/application/view.dart';
import 'package:chat_app/screens/sign_in/bindings.dart';
import 'package:chat_app/screens/sign_in/view.dart';
import 'package:chat_app/screens/welcome/bindings.dart';
import 'package:chat_app/screens/welcome/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/application/index.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
  // static final RouteObserver<Routes> observer = RouteObservers()
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomeScreen(),
      binding: WelcomeBindings(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      // ],
    ),
  
 
     GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInScreen(),
      binding: SignInBindings(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      // ],
    ),
    
     GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationScreen(),
      binding: ApplicationBindings(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      // ],
    ),
    /*
     GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
     GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
     GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    */
  ];
}

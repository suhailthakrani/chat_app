// import 'package:chat_app/screens/application/index.dart';
// import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';

// class RouteChatMiddleware extends GetMiddleware {

//   @override
//   int? priority = 0;

//   RouteChatMiddleware({required this.priority});

//   @override
//   RouteSettings? redirect(String? route) {
//     print(ConfigStrore.to.isFirstOpen);

//     if (!ConfigStrore.to.isFirstOpen) {
//       // If user open app first time
//       return null;
//     } else if (UserStore.to.isLogin){
//       // If user is alread logged in
//       return const RouteSettings(name: AppRoutes.Application);
//     }
//     else {
//       // If user has oppened app, but not logged in
//       return const RouteSettings(name: AppRoutes.SIGN_IN);
//     }
//   }
// }
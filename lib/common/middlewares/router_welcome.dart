import 'package:chat_app/screens/application/index.dart';


class RouteWelcomeMiddleware extends GetMiddleware {

  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStrore.to.isFirstOpen);

    if (ConfigStrore.to.isFirstOpen == false) {
      // If user open app first time
      return null;
    } else if (UserStore.to.isLogin == true){
      // If user is alread logged in
      return const RouteSettings(name: AppRoutes.Application);
    }
    else {
      // If user has oppened app, but not logged in
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
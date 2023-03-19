import 'package:chat_app/common/middlewares/router_welcome.dart';
import 'package:chat_app/screens/contacts/index.dart';
import 'package:chat_app/screens/message/bindings.dart';
import 'package:chat_app/screens/message/components/chat/index.dart';
import 'package:chat_app/screens/message/view.dart';
import 'package:chat_app/screens/profile/bindings.dart';
import 'package:chat_app/screens/profile/view.dart';
import 'package:chat_app/screens/sign_in/bindings.dart';
import 'package:chat_app/screens/sign_in/view.dart';
import 'package:chat_app/screens/welcome/bindings.dart';
import 'package:chat_app/screens/welcome/view.dart';

import '../../screens/application/index.dart';
import '../../screens/message/components/photoview/index.dart';

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
      middlewares: [
        // RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInScreen(),
      binding: SignInBindings(),
      middlewares: [
        // RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationScreen(),
      binding: ApplicationBindings(),
      middlewares: [
        // RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Contact,
      page: () => ContactsScreen(),
      binding: ContactBindings(),
      middlewares: [
        // RouteContactsMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: '/chat',
      page: () => ChatScreen(),
      binding: ChatBindings(),
      middlewares: [
        // RouteContactsMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Message,
      page: () => MessageScreen(),
      binding: MessageBindings(),
      middlewares: [
        // RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.PhotoImageView,
      page: () => const PhotoViewScreen(),
      binding: PhotoViewBindings(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Me,
      page: () => const ProfileScreen(),
      binding: ProfileBindings(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
  ];
}

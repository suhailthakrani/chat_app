import '../../common/entities/user_data.dart';
import '../../common/entities/user_model.dart';
import 'index.dart';

class ApplicationController extends GetxController {
  ApplicationController();
  final state = ApplicationState();

  final List<BottomNavigationBarItem> tabItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.message),
      activeIcon: Icon(Icons.message),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.contact_page),
      activeIcon: Icon(Icons.contact_page),
      label: 'Contact',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    )
  ];

  //
  bool _isInitialized = false;
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  @override
  void onInit() {
    tabTitles = ['Chat', 'Contact', 'Profile'];
    bottomTabs = tabItems;
    pageController = PageController(
      initialPage: 0,
    );
    
    super.onInit();
  }

  // void initialize() {
  //   if (!initialized) {
  //     pageController = PageController(
  //       initialPage: state.page,
  //     );
  //     // Do any other initialization tasks here
  //     // For example, fetch data from a server or database
  //     _isInitialized = true;
  //   }
  // }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Manage the page changes in application
  void onPageChanged(int index) {
    state.page = index;
  }

  void onNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}

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
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  
  @override
  void onInit() {
    tabTitles = ['Chat', 'Contact', 'Profile'];
    bottomTabs = tabItems;

    pageController = PageController(initialPage: state.page,);
    super.onInit();
  }


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
    state.page = index;
  } 
  
}

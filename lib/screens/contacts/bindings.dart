

import 'index.dart';

class ContactBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ContactsController>(() => ContactsController());
  }

}
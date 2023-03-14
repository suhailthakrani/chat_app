import 'package:chat_app/common/entities/user_data.dart';

import 'index.dart';


class ContactsController extends GetxController {
  ContactsController();
  final ContactsState state = ContactsState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;


  @override
  onReady() {
    
    super.onReady();
    loadAllDataFromFirebase();
  }



  loadAllDataFromFirebase() async {
    var users = await db.collection('users').where('id', isNotEqualTo: token).withConverter(fromFirestore: UserData.fromFirestore, toFirestore:(UserData userData, options) {
      return userData.toFirestore();
    },).get();

    for (var user in users.docs) {
      state.contactList.add(user.data());
    }
  }



  
}

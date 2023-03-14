import 'package:chat_app/screens/contacts/components/contact_list.dart';

import 'index.dart';

class ContactsScreen extends GetView<ContactsController> {
  const ContactsScreen({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "Contact",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }
}

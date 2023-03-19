import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/message/controller.dart';
import 'package:chat_app/screens/message/message_list.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessageScreen extends GetView<MessageController> {
  const MessageScreen({super.key});
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        "Messages",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const MessageList(),
      
    );
  }
}

import 'package:chat_app/screens/message/index.dart';
import 'package:chat_app/screens/message/message_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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

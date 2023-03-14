// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chat_app/common/entities/message_content.dart';
import 'package:chat_app/common/entities/user_data.dart';
import 'package:chat_app/common/entities/user_model.dart';

import '../../common/entities/message_data.dart';
import 'index.dart';

class ChatController extends GetxController {
  ChatController();
  final ChatState state = ChatState();

  //
  final textMessageController = TextEditingController();
  ScrollController messagesScrollController = ScrollController();
  final db = FirebaseFirestore.instance;
  final user_id = UserStore.to.token;
  var doc_id;


  @override
  void onInit() {
    var data = Get.parameters;
    doc_id = data['doc_id'] ?? '';
    state.to_uid.value = data['to_uid'] ?? '';
    state.to_name.value = data['to_name'] ?? '';
    state.to_avtar.value = data['to_avtar'] ?? '';
    // state.to_name.value = data['to_name'] ?? '';  

    super.onInit();
  }

  // Send message
  sendMessage() {
    String sendContent = textMessageController.text;
    final content  = MsgContent(
      uid: user_id,
      content: sendContent,
      type :'text',
      addTime: Timestamp.now(),
    );
  }
 

  
}


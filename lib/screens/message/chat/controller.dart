// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chat_app/common/entities/message_content.dart';
import 'package:chat_app/common/entities/user_data.dart';
import 'package:chat_app/common/entities/user_model.dart';

import '../../../common/entities/message_data.dart';
import 'index.dart';

class ChatController extends GetxController {
  ChatController();
  final ChatState state = ChatState();

  //
  final textMessageController = TextEditingController();
  ScrollController messagesScrollController = ScrollController();
  FocusNode contentMode = FocusNode();
  final db = FirebaseFirestore.instance;
  final user_id = UserStore.to.token;

  var listener;
  //
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
  sendMessage() async {
    String sendContent = textMessageController.text;
    final content = MsgContent(
      uid: user_id,
      content: sendContent,
      type: 'text',
      addTime: Timestamp.now(),
    );

    await db
        .collection('messages')
        .doc(doc_id)
        .collection('msglist')
        .withConverter(
          fromFirestore: MsgContent.fromFirestore,
          toFirestore: (msgContent, options) => msgContent.toFirestore(),
        )
        .add(content)
        .then((DocumentReference doc) => print(
              "Document snapshot added with id: ${doc.id}",
            ));
    textMessageController.clear();
    Get.focusScope?.unfocus();

    //
    await db.collection('messages').doc(doc_id).update({
      'last_msg': sendContent,
      'last_time': Timestamp.now(),
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("LOADING MESSAGES.....");
    var messages = db
        .collection('messages')
        .doc(doc_id)
        .collection('msglist')
        .withConverter(
          fromFirestore: MsgContent.fromFirestore,
          toFirestore: (MsgContent msgContent, options) =>
              msgContent.toFirestore(),
        )
        .orderBy('addTime', descending: true);
    print("AAAAAAAAAAAAAAAA ${messages.count().get()}");
    state.messageContentList.clear();
    listener = messages.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              state.messageContentList.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
          default:
        }
      }
    }, onError: (error) => print("Listen Faild:  ${error}"));
  }

  @override
  void dispose() {
    messagesScrollController.dispose();
    listener.cancel();
    super.dispose();
  }
}

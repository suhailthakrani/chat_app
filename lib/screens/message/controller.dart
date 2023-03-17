import 'package:chat_app/common/entities/message_data.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/message/state.dart';
import 'package:chat_app/screens/message/view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageController extends GetxController {
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  final MessageState messageState = MessageState();
  var listener;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  loadMessages() async {
    var from_messages = await db
        .collection('messages')
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (msg, options) => msg.toFirestore(),
        )
        .where('from_uid', isEqualTo: token)
        .get();
    var to_messages = await db
        .collection('messages')
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (msg, options) => msg.toFirestore(),
        )
        .where('to_uid', isEqualTo: token)
        .get();
  }
}

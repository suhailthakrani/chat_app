import 'dart:convert';

import 'package:chat_app/common/entities/user_data.dart';
import 'package:chat_app/common/entities/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../common/entities/message_data.dart';
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

  doChat(UserData to_userData) async {
    // message sender
    var from_messages = await db
        .collection('messages')
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) {
            return msg.toFirestore();
          },
        )
        .where('from_uid', isEqualTo: token)
        .where('to_uid', isEqualTo: to_userData.id)
        .get();

    // Message Reciever
    var to_messages = await db
        .collection('messages')
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) {
            return msg.toFirestore();
          },
        )
        .where('from_uid', isEqualTo: to_userData.id)
        .where('to_uid', isEqualTo: token)
        .get();

    if (from_messages.docs.isEmpty && to_messages.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      print("PPPPPPPPPPPPPP: ${profile.characters}");

      // UserModel user = UserModel.fromJson(profile.replaceAll('\n', ' '));
      // print("jjjjjjjjjjjjjj: ${user}");
      var messageData = Msg(
        from_uid: FirebaseAuth.instance.currentUser!.refreshToken ?? '',
        to_uid: to_userData.id,
        from_name: FirebaseAuth.instance.currentUser!.displayName ?? 'Unknown',
        to_name: to_userData.displayName,
        from_avtar: FirebaseAuth.instance.currentUser!.photoURL ?? '',
        to_avtar: to_userData.photoUrl,
        last_msg: '',
        last_time: Timestamp.now(),
        msg_num: 0,
      );

      db
          .collection('messages')
          .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (message, options) => message.toFirestore(),
          )
          .add(messageData)
          .then((value) {
        Get.toNamed('/chat', parameters: {
          'doc_id': value.id,
          'to_uid': to_userData.id ?? '',
          'to_name': to_userData.displayName ?? '',
          'to_avtar': to_userData.photoUrl ?? '',
        });
      });
    } else {
      if (from_messages.docs.isNotEmpty) {
        Get.toNamed('/chat', parameters: {
          'doc_id': from_messages.docs.first.id,
          'to_uid': to_userData.id ?? '',
          'to_name': to_userData.displayName ?? '',
          'to_avtar': to_userData.photoUrl ?? '',
        });
      }
      if (to_messages.docs.isNotEmpty) {
        Get.toNamed('/chat', parameters: {
          'doc_id': to_messages.docs.first.id,
          'to_uid': to_userData.id ?? '',
          'to_name': to_userData.displayName ?? '',
          'to_avtar': to_userData.photoUrl ?? '',
        });
      }
    }
  }

  loadAllDataFromFirebase() async {
    var users = await db
        .collection('users')
        .where('id', isNotEqualTo: token)
        .withConverter(
          fromFirestore: UserData.fromFirestore,
          toFirestore: (UserData userData, options) {
            return userData.toFirestore();
          },
        )
        .get();

    for (var user in users.docs) {
      state.contactList.add(user.data());
    }
    print(users);
  }
}

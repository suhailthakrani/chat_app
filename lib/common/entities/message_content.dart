import '../../screens/message/chat/index.dart';

class MsgContent {
  final String uid;
  final String content;
  final String type;
  final Timestamp addTime;
  MsgContent({
    required this.uid,
    required this.content,
    required this.type,
    required this.addTime,
  });

  factory MsgContent.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final map = snapshot.data() ?? {};
    return MsgContent(
        uid: map['uid'] != null ? map['uid'] as String : '',
        content: map['content'] != null ? map['content'] as String : '',
        type: map['type'] != null ? map['type'] as String : '',
        addTime: map['addTime'] as Timestamp);
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      if (uid != null) 'uid': uid,
      if (content != null) 'content': content,
      if (type != null) 'type': type,
      if (addTime != null) 'addTime': addTime,
    };
  }
}

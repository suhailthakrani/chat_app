import '../../screens/chat/index.dart';

class MsgContent {
  final String? uid;
  final String?  content;
  final String? type;
  final Timestamp? addTime;
  MsgContent({
    this.uid,
    this.content,
    this.type,
    this.addTime,
  });

  factory MsgContent.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final map = snapshot.data();
     return MsgContent(
      uid: map?['uid'] != null ? map!['uid'] as String : null,
      content: map?['content'] != null ? map!['content'] as String : null,
      type: map?['type'] != null ? map!['type'] as String : null,
      
      addTime: map?['addTime'] != null ?  map!['addTime'] as Timestamp : null
    );
  }

 Map<String, dynamic> toFirestore() {
  return <String, dynamic>{
      if(uid != null)'uid': uid,
      if(content != null) 'content': content,
      if(type != null) 'type': type,
      
      if(addTime != null) 'addTime': addTime,
    };
 }
}

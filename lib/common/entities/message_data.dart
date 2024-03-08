// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/screens/application/index.dart';

class Msg {
  final String? from_uid;
  final String? to_uid;
  final String? from_name;
  final String? to_name;
  final String? from_avtar;
  final String? to_avtar;
  final String? last_msg;
  final Timestamp? last_time;
  final int? msg_num;
  Msg({
    this.from_uid,
    this.to_uid,
    this.from_name,
    this.to_name,
    this.from_avtar,
    this.to_avtar,
    this.last_msg,
    this.last_time,
    this.msg_num,
  });
   factory Msg.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final map = snapshot.data();
     return Msg(
        from_uid: map?['from_uid'] != null ? map!['from_uid'] as String : null,
        to_uid : map?['to_uid'] != null ? map!['to_uid'] as String : null,
        from_name : map?['from_name'] != null ? map!['from_name'] as String : null,
        to_name : map?['to_name'] != null ? map!['to_name'] as String : null,
        from_avtar : map?['from_avtar'] != null ? map!['from_avtar'] as String : null,
        to_avtar : map?['to_avtar'] != null ? map!['to_avtar'] as String : null,
        last_msg : map?['last_msg'] != null ? map!['last_msg'] as String : null,
        last_time : map?['last_time'] != null ? map!['last_time'] as Timestamp : null,
        msg_num : map?['msg_num'] != null ? map!['msg_num'] as int : null,
    
    );
  }

 Map<String, dynamic> toFirestore() {
  return <String, dynamic>{
  if( from_uid!= null ) 'from_uid':from_uid, 
    if( to_uid != null ) 'to_uid': to_uid,
       if( from_name != null ) 'from_name': from_name,
     if(   to_name != null ) 'to_name': to_name,
        if(from_avtar != null ) 'from_avtar': from_avtar,
      if(  to_avtar != null ) 'to_avtar': to_avtar,
      if(  last_msg != null ) 'last_msg': last_msg,
       if( last_time != null ) 'last_time': last_time,
     if(   msg_num != null ) 'msg_num':   msg_num ,
     
    };
 }

}

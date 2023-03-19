import 'package:chat_app/common/entities/message_content.dart';
import 'package:chat_app/common/entities/user_data.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

import 'index.dart';
class ChatState {
  RxList<MsgContent> messageContentList = <MsgContent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avtar = "".obs;
  var to_location = "unkown".obs;

  

}
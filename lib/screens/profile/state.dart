import 'package:chat_app/common/entities/me_list_item.dart';
import 'package:chat_app/common/entities/message_data.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/sign_in/index.dart';

class ProfileState {
  //
  var head_detail = Rx<UserModel?>(null);
  // For the current user info
  RxList<MeListItem> meListItem = <MeListItem>[].obs;

  //
}
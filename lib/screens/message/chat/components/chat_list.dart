import 'package:chat_app/screens/message/chat/components/chat_sender_item.dart';
import 'package:chat_app/screens/message/chat/index.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      color: Colors.grey.shade500,
      padding: EdgeInsets.only(bottom: 50),
      child: CustomScrollView(
        reverse: true,
        controller: controller.messagesScrollController,
        slivers: [
          SliverPadding(padding:EdgeInsets.symmetric(horizontal: 0, vertical: 0,),
          sliver: SliverList(delegate: SliverChildBuilderDelegate(
            childCount: controller.state.messageContentList.length,
            
            (context, index) {
            var item = controller.state.messageContentList[index];
            if (controller.user_id  == item.uid) {
              return chatRightWidget(item);
            }
            return null;
          })),
          )
        ],
      ),
    ));
  }
}
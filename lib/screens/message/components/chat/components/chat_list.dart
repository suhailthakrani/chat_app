import 'package:chat_app/screens/message/components/chat/components/chat_reciever_item.dart';
import 'package:chat_app/screens/message/components/chat/components/chat_sender_item.dart';
import 'package:chat_app/screens/message/components/chat/index.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 50),
          child: CustomScrollView(
            reverse: true,
            controller: controller.messagesScrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: controller.state.messageContentList.length,
                        (context, index) {
                  var item = controller.state.messageContentList[index];

                  if (controller.user_id == item.uid) {
                    return chatSenderWidget(item);
                  } else {
                    return chatRecieverWidget(item);
                  }
                })),
              )
            ],
          ),
        ));
  }
}

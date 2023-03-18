import 'package:chat_app/common/entities/message_data.dart';
import 'package:chat_app/screens/message/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageList extends GetView<MessageController> {
  const MessageList({super.key});
  Widget messageListItem(QueryDocumentSnapshot<Msg> item) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xffe5efe5),
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          var to_uid = "";
          var to_name = "";
          var to_avtar = "";
          if (item.data().from_uid == controller.token) {
            to_uid = item.data().to_uid ?? "";
            to_name = item.data().to_name ?? "";
            to_avtar = item.data().to_avtar ?? "";
          } else {
            to_uid = item.data().from_uid ?? "";
            to_name = item.data().from_name ?? "";
            to_avtar = item.data().from_avtar ?? "";
          }
          Get.toNamed('/chat', parameters: {
            "doc_id": item.id,
            "to_uid": to_uid,
            "to_name": to_name,
            "to_avtar": to_avtar,
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0, left: 0, right: 15),
              width: 54,
              height: 54,
              child: CachedNetworkImage(
                imageUrl: item.data().from_uid == controller.token
                    ? (item.data().to_avtar ?? '')
                    : (item.data().from_avtar ?? ''),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Image(
                    image: AssetImage('assets/images/profile.png'),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.data().from_uid == controller.token
                            ? (item.data().to_name ?? '')
                            : (item.data().from_name ?? ''),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        timeLineFormater(item.data().last_time!.toDate()),
                        style: const TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    item.data().last_msg ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onLoading: controller.onLoading,
      onRefresh: controller.onRefresh,
      header: const WaterDropHeader(),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.messageState.messageList.length,
                (context, index) {
                  if (controller.messageState.messageList.isNotEmpty) {
                    var item = controller.messageState.messageList[index];
                    return messageListItem(item);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

String timeLineFormater(DateTime dateTime) {
  var now = DateTime.now();
  var difference = now.difference(dateTime);
  print(difference.inHours);
  print(difference.inDays);

  if (difference.inMinutes < 60) {
    return "${difference.inMinutes} m ago";
  }
  if (difference.inHours < 24) {
    return "${difference.inMinutes} h ago";
  } else if (difference.inDays < 30) {
    return "${difference.inDays} d ago";
  } else if (difference.inDays < 365) {
    final dateFormat = DateFormat("MM-dd");

    return dateFormat.format(dateTime);
  } else {
    final dateFormat = DateFormat("yyyy-MM-dd");

    return dateFormat.format(dateTime);
  }
}

import 'package:chat_app/common/entities/message_content.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Widget chatRecieverWidget(MsgContent msgContent) {
  return Container(
    padding: EdgeInsets.only(
      top: 10,
      left: 15,
      // right: 15,
      bottom: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Outer Contrainet Box
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 230, maxHeight: 100),
          child: Container(
            padding: msgContent.type == 'text'
                ? EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10)
                : EdgeInsets.all(2),
            margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: msgContent.type == 'text'
                ? InkWell(
                    onTap: () {
                      print(msgContent.content);
                      print("Clicked........................");
                    },
                    child: Text(
                      (msgContent.content),
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  )
                : ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 80,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.PhotoImageView,
                            parameters: {"imgUel": msgContent.content});
                      },
                      child: CachedNetworkImage(
                        imageUrl: msgContent.content,
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.error_outline,
                          );
                        },
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            // height: 44,
                            // width: 44,
                            margin: null,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ),
      ],
    ),
  );
}

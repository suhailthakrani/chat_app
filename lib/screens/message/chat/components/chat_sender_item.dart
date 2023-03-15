import 'package:chat_app/common/entities/message_content.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Widget chatRightWidget(MsgContent msgContent) {
  return Container(
    padding: EdgeInsets.only(
      top: 10,
      left: 15,
      right: 15,
      bottom: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Outer Contrainet Box
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 230, maxHeight: 40),
          child: Container(
            padding: EdgeInsets.only(
                top: 10, left: 15, right: 15, bottom: 10),
            margin: EdgeInsets.only(
                top: 10, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(10),
            ),
            child: msgContent.type == 'text'
                ? Text("${msgContent.content}")
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 80,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //
                      },
                      child: CachedNetworkImage(
                        imageUrl: "${msgContent.content}",
                        errorWidget: (context, url, error) {
                          return Icon(
                            Icons.error_outline,
                          );
                        },
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: 44,
                            width: 44,
                            margin: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44),
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

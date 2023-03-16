import 'package:chat_app/screens/contacts/components/contact_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/screens/message/chat/components/chat_list.dart';
import 'package:flutter/cupertino.dart';

import 'index.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  AppBar _buildAppBar(context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
        title: InkWell(
          onTap: () {
            print(controller.state.messageContentList.first.content == ''
                ? "jjjjjjjjjjj"
                : controller.state.messageContentList.first.content);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                  child: InkWell(
                    child: SizedBox(
                      height: 44,
                      width: 44,
                      child: CachedNetworkImage(
                        imageUrl: controller.state.to_avtar.value,
                        errorWidget: (context, url, error) {
                          return InkWell(
                            onTap: () {
                              // print(controller.state.messageContentList);
                            },
                            child: Icon(
                              CupertinoIcons.person_alt_circle,
                            ),
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
                SizedBox(width: 15),
                Container(
                  width: 180,
                  padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 180,
                        height: 44,
                        child: GestureDetector(
                          onTap: () {
                            // Will be implemented in future
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.state.to_name.value,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'unkown location',
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ChatList(),
                Positioned(
                  bottom: 0,
                  height: 50,
                  child: Container(
                    width: 360,
                    height: 58,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 217,
                          height: 50,
                          child: TextField(
                            controller: controller.textMessageController,
                            autofocus: false,
                            focusNode: controller.contentMode,
                            decoration: InputDecoration(
                              hintText: 'Send messages...',
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(left: 5),
                          child: GestureDetector(
                            onTap: () {
                              // Implement later
                            },
                            child: Icon(
                              Icons.image_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          width: 64,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.sendMessage();
                              },
                              child: Text('Send')),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:chat_app/screens/contacts/components/contact_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        title: Padding(
          padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
                child: InkWell(
                  child: SizedBox(
                    height: 44.w,
                    width: 44.w,
                    child: CachedNetworkImage(
                      imageUrl: controller.state.to_avtar.value,
                      errorWidget: (context, url, error) {
                        return Icon(CupertinoIcons.person_alt_circle,);
                      },
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 44.w,
                          width: 44.w,
                          margin: null,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44.w),
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
              SizedBox(width: 15.w),
              Container(
                width: 180.w,
                 padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
                 child: Row(
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 44.w,
                      child: GestureDetector(
                        onTap: () {
                          // Will be implemented in future
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.state.to_name.value, overflow: TextOverflow.clip, maxLines: 1,style: TextStyle(
                              fontFamily: 'Avenir', 
                              fontWeight: FontWeight.bold, fontSize: 16.sp,
                            ),),
                                                        Text('unkown location', overflow: TextOverflow.clip, maxLines: 1,style: TextStyle(
                              fontFamily: 'Avenir', 
                              fontWeight: FontWeight.bold, fontSize: 16.sp,
                            ),)
                            
                          ],
                        ),
                      ),
                    )
                  ],
                 ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ContactList(),
    );
  }
}

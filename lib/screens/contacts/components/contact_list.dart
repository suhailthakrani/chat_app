import 'package:chat_app/common/entities/user_data.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/contacts/controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactList extends GetView<ContactsController> {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.state.contactList.length,
                (context, index) {
                  var contact = controller.state.contactList[index];
                  return _buildContactWidget(contact);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactWidget(UserData userData) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.w,
        left: 15.w,
        right: 15.w,
      ),
      child: InkWell(
        onTap: () {
          if (userData.id != null) {
            controller.doChat(userData);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 0.w,
                left: 0.w,
                right: 15.w,
              ),
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                child: CachedNetworkImage(
                  imageUrl: "${userData.photoUrl}",
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 54.w,
                      width: 54.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                      ),
                      child: Text(
                        userData.displayName![0],
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 15.w,
                left: 0.w,
                right: 0.w,
              ),
              width: 250.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xffe5efe5),
                  ),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 42.w,
                    child: Text(
                      userData.displayName ?? '',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

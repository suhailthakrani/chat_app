import 'package:chat_app/common/entities/user_data.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/contacts/controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactList extends GetView<ContactsController> {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
        top: 15,
        left: 15,
        right: 15,
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
                top: 0,
                left: 0,
                right: 15,
              ),
              child: SizedBox(
                width: 54,
                height: 54,
                child: CachedNetworkImage(
                  imageUrl: "${userData.photoUrl}",
                  imageBuilder: (context, imageProvider) {
                    return Container();
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 54,
                      width: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                      ),
                      child: Text(
                        userData.displayName![0],
                        style: TextStyle(
                          fontSize: 28,
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
                top: 15,
                left: 0,
                right: 0,
              ),
              width: 250,
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
                    width: 200,
                    height: 42,
                    child: Text(
                      userData.displayName ?? '',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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

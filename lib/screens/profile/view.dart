import 'package:chat_app/common/entities/me_list_item.dart';
import 'package:chat_app/screens/application/index.dart';
import 'package:chat_app/screens/message/message_list.dart';
import 'package:chat_app/screens/profile/components/head_item.dart';
import 'package:chat_app/screens/profile/controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        "Profile",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget myItem(MeListItem item) {
    return Container(
      height: 56,
      color: Colors.purple,
      margin: EdgeInsets.only(bottom: 1),
      padding: EdgeInsets.only(
        top: 0,
        left: 15,
        right: 15,
      ),
      child: InkWell(
        onTap: () {
          if (item.route == "/logout") {
            controller.logout();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 56,
                  child: Image.asset(
                    item.icon ?? "assets/images/profile.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    item.name ?? "",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  child: Image.asset(
                    item.icon ?? "assets/images/profile.png",
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() => CustomScrollView(
            slivers: [
              SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  sliver: SliverToBoxAdapter(
                    child: controller.state.head_detail.value == null
                        ? Container()
                        : headItem(controller.state.head_detail.value!,),
                  )),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: controller.state.meListItem.length,
                      (context, index) {
                    var item = controller.state.meListItem[index];
                    return myItem(item);
                  }),
                ),
              ),
            ],
          ),),
    );
  }
}

import 'package:chat_app/screens/application/index.dart';

import '../../../common/entities/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget headItem(UserModel userModel) {
  return Container(
    padding: EdgeInsets.only(
      top: 30,
      left: 15,
      right: 15,
      bottom: 15,
    ),
    margin: EdgeInsets.only(bottom: 30),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(
              0,
              5,
            ),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            //
          },
          child: SizedBox(
            height: 54,
            width: 54,
            child: CachedNetworkImage(
              imageUrl: userModel.photoUrl ?? "",
              height: 54,
              width: 54,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: imageProvider,
                  )),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.displayName ?? "",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "ID: ${userModel.accessToken}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

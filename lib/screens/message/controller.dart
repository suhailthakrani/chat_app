import 'package:chat_app/screens/message/index.dart';
import 'package:get/get.dart';

import '../../common/store/user_store.dart';
export 'package:pull_to_refresh/pull_to_refresh.dart';
export 'package:dio/dio.dart';

class MessageController extends GetxController {
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  final MessageState messageState = MessageState();
  var listener;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  void onLoading() {
    loadMessages().then((_) {
      refreshController.loadComplete();
    }).catchError(
      (_) => refreshController.loadFailed(),
    );
    notifyChildrens();
  }

  @override
  void onInit() {
    loadMessages();
    super.onInit();
  }

// To refresh the messages
  void onRefresh() {
    loadMessages().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
      notifyChildrens();
    }).catchError(
      (_) => refreshController.refreshFailed(),
    );
  }

  loadMessages() async {
    var fromMessages = await db
        .collection('messages')
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (msg, options) => msg.toFirestore(),
        )
        .where('from_uid', isEqualTo: token)
        .get();
    var toMessages = await db
        .collection('messages')
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (msg, options) => msg.toFirestore(),
        )
        .where('to_uid', isEqualTo: token)
        .get();

    if (messageState.messageList.isNotEmpty) {
      messageState.messageList.clear();
    }
    if (fromMessages.docs.isNotEmpty) {
      messageState.messageList.assignAll(fromMessages.docs);
    }
    if (toMessages.docs.isNotEmpty) {
      messageState.messageList.assignAll(toMessages.docs);
    }

    notifyChildrens();
  }

  //
  getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      var user =
          await db.collection('users').where('id', isEqualTo: token).get();
      if (user.docs.isNotEmpty) {
        var doc_id = user.docs.first.id;
        await db.collection('users').doc(doc_id).update({
          'fcmToken': fcmToken,
        });
      }
    }
    notifyChildrens();
  }

  //
  // To get user location
  getUserLocation() async {
    try {
      String key = "AIzaSyDk1EmlRdmQW-QXW8NoTSRlzMjs5x4pMk0";
      final location = await Location().getLocation();
      String address = "${location.latitude} ${location.latitude}";
      String url =
          "https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$key";
      // var response = await HttpUtil().get(url);
      // MyLocation location_response = MyLocation.fromJson(json.decode(response.body));
    } catch (error) {
      print("[Error in fectching data from apis]: $error.");
    }
  }
}

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;
  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'SERVER_API_URL',
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );
  }
}

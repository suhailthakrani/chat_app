import 'package:chat_app/screens/message/components/photoview/index.dart';
import 'package:photo_view/photo_view.dart';


class PhotoViewScreen extends GetView<PhotoViewImageController> {
  const PhotoViewScreen({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "Photo View",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.cloud_circle))],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: PhotoView(
          loadingBuilder: (context, event) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          imageProvider: NetworkImage(controller.state.imgUrl.value),
        ),
      ),
    );
  }
}

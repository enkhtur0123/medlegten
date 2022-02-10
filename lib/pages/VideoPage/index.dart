import 'package:flutter/widgets.dart';
import 'package:medlegten/models/video/category.dart';
import 'package:medlegten/pages/VideoPage/category_list.dart';
import 'package:medlegten/repositories/video_repository.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VideoPageState();
  }
}

class VideoPageState extends State<VideoPage> {
  List<Category>? categories = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder(
            future: VideoRepository().getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                categories = snapshot.data as List<Category>?;
                return CategoryPage(category: categories);
              } else {
                return Container();
              }
            })
      ],
    );
  }
}

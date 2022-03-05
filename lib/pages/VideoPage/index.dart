import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:medlegten/models/video/category.dart';
import 'package:medlegten/models/video/level_event.dart';
import 'package:medlegten/pages/VideoPage/category_list.dart';
import 'package:medlegten/pages/VideoPage/level_event_list.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/app_router.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VideoPageState();
  }
}

class VideoPageState extends State<VideoPage> {
  List<Category>? categories = [];
  List<LevelEvent>? levelEvents;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        FutureBuilder(
            future: VideoRepository().getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                categories = snapshot.data as List<Category>?;
                return CategoryPage(
                  category: categories,
                  onTap: (String id, String name) {
                    print(id);
                    AutoRouter.of(context).push(LevelVideoListRoute(
                        categoryId: id,
                        categoryName: name,
                        isCategorySearch: true));
                  },
                );
              } else {
                return Container();
              }
            }),
        FutureBuilder(
            future: VideoRepository().getLevelEvent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                levelEvents = snapshot.data as List<LevelEvent>?;
                return Expanded(
                    child: LevelEventPage(levelEvents: levelEvents));
              } else {
                return Container();
              }
            }),
      ],
    );
  }
}

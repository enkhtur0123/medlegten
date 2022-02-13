import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/pages/VideoPage/level_event_item.dart';
import 'package:medlegten/repositories/video_repository.dart';

// ignore: must_be_immutable
class LevelVideoListPage extends HookWidget {
  LevelVideoListPage({Key? key, this.levelId}) : super(key: key);

  String? levelId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Event>>(
        future: VideoRepository().getLevelAllEvent(level_id: levelId),
        builder: (context, AsyncSnapshot<List<Event>?> snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.58,
                      child: LevelEventItem(
                        edgeInsets:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        event: snapshot.data![index],
                      ),
                    );
                  }),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

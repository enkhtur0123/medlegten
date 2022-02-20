import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';
import 'package:medlegten/utils/global.dart';
import 'package:video_player/video_player.dart';

//https://pbhoomi190.medium.com/creating-a-base-screen-in-flutter-using-an-abstract-class-and-mixin-3c0001b74c8c

abstract class BaseVideoPage extends StatefulWidget {
  const BaseVideoPage(
    this.videoUrl, {
    Key? key,
    this.moduleId,
    this.title,
    this.isCompleted,
    this.isSerial,
    this.movies,
  }) : super(key: key);
  final String videoUrl;
  final bool? isSerial;
  final String? moduleId;
  final String? title;
  final bool? isCompleted;
  final List<Movie>? movies;
}

abstract class BaseVideoPageState<Page extends BaseVideoPage>
    extends State<Page> {
  VideoPlayerController? videoPlayerController;
  String? moduleId;
  bool? isFirst = true;
  @override
  void initState() {
    super.initState();
    moduleId = widget.moduleId;
    initVideoPlayer();
  }

  initVideoPlayer({String? changedUrl}) {
    String videoUrl;
    if (changedUrl != null) {
      videoUrl = changedUrl;
    } else {
      videoUrl = widget.videoUrl;
    }
    if (videoPlayerController != null &&
        videoPlayerController!.value.isInitialized) {
      videoPlayerController!.dispose();
    }
    videoPlayerController = widget.videoUrl.startsWith('assets')
        ? VideoPlayerController.asset(widget.videoUrl)
        : VideoPlayerController.network(videoUrl);
    videoPlayerController!
      ..setLooping(false)
      ..initialize().then((value) {
        if (isFirst!) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            setState(() {
              videoPlayerController!.play();
              isFirst = false;
            });
          });
        } else {
          setState(() {
            videoPlayerController!.play();
          });
        }
      });
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }
}

mixin BaseVideoMixin<Page extends BaseVideoPage> on BaseVideoPageState<Page> {
  int? currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (videoPlayerController!.value.isInitialized) {
      list.add(getVideoPlayerWidget());
      list.add(addVerticalSpace(10));
      if (widget.isSerial!) {
        list.add(getSerialWidget());
      }
      // list.add(subtitleWidget());
    } else {
      list.add(
        const AspectRatio(
          aspectRatio: 16 / 9,
          child: SizedBox(
            width: double.infinity,
            child: Loading(),
          ),
        ),
      );
      // list.add(
      //   SizedBox(
      //     height: GlobalValues.screenHeight - 100,
      //     child: const Loading(),
      //   ),
      // );
    }

    list.add(addVerticalSpace(10));
    list.add(subtitleWidget());

    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Stack(children: [
        Positioned(
          top: unitHeaderHeight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - unitHeaderHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: unitHeaderHeight + 8,
          child: UnitAppBar(
            widget.title ?? "",
            moduleId: moduleId,
            isCompleted: widget.isCompleted,
          ),
        ),
      ]),
      bottomSheet: bottomSheetWidget(),
    );
  }

  ///Video Player widget
  Widget getVideoPlayerWidget() {
    return VideoPlayerChewie(videoPlayerController!);
  }

  ///Get Serial Widget
  Widget getSerialWidget() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      height: 65,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.movies!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                onTapIndex(index);
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, bottom: 15, top: 15, right: 0),
                padding: const EdgeInsets.only(left: 12,right: 12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(color: currentIndex==index?Colors.transparent: const Color(0xffA8AFE5)),
                  color: currentIndex == index
                      ? colorPrimary
                      : Colors.white,
                ),
                child: Center(child: Text(
                  (index+1).toString(),
                  style: TextStyle(
                      color: currentIndex == index
                          ? Colors.white
                          : const Color(0xffA8AFE5),
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                )),
              ),
            );
          }),
    );
  }

  onTapIndex(int index) {
    return index;
  }

  Duration getDuration(String time) {
    var splitted = time.split(':');
    return Duration(
      hours: int.parse(splitted[0]),
      minutes: int.parse(splitted[1]),
      seconds: int.parse(splitted[2].split('.')[0]),
      milliseconds: int.parse(splitted[2].split('.')[1]),
    );
  }

  Widget subtitleWidget() {
    return const SizedBox(height: 1);
  }

  Widget bottomSheetWidget() {
    return const SizedBox(height: 1);
  }

  Widget appBarTailWidget() {
    return const SizedBox(height: 1);
  }
}

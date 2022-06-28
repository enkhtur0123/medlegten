import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_video_play.dart';
import 'package:video_player/video_player.dart';
import '../unit/unit_module_completed_btn.dart';

typedef SubVideoCallback = void Function(int callIndex, bool next);

class WritingVideoPage extends StatefulWidget {
  const WritingVideoPage(this.unitWriting, this.unitTitle,
      {Key? key, this.moduleId, this.isCompleted})
      : super(key: key);

  final UnitWriting unitWriting;
  final String? moduleId;
  final bool? isCompleted;
  final String unitTitle;

  @override
  _WritingVideoPageState createState() => _WritingVideoPageState();
}

class _WritingVideoPageState extends State<WritingVideoPage> {
  VideoPlayerController? videoPlayerController;
  int currentIndex = 0;
  bool? isFirst = true;
  List<Widget> listWidget = [];
  late ScrollController _homeController;
  @override
  void initState() {
    _homeController = ScrollController();
    _homeController.addListener(() {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        _homeController.position.jumpTo(0);
      }
    });
    if (widget.unitWriting.videos.isNotEmpty) {
      initVideoPlayer(widget.unitWriting.videos[0].hostUrl);
    }
    for (int i = 0; i < widget.unitWriting.videos.length; i++) {
      var myWidget = WritingVideoSubPage(widget.unitWriting.videos[i], [
        i - 1, //if -1 then no prev button
        i, //current index
        i - (widget.unitWriting.videos.length - 1), // if 0 then no next button
        widget.unitWriting.videos.length,
        currentIndex,
      ], (callBackIndex, next) {
        currentIndex = next ? callBackIndex + 1 : callBackIndex - 1;
        initVideoPlayer(widget.unitWriting.videos[currentIndex].hostUrl);
        setState(() {});
      }, videoPlayerController!);

      listWidget.add(myWidget);
    }

    super.initState();
  }

//
  initVideoPlayer(String videoUrl) {
    if (videoPlayerController != null &&
        videoPlayerController!.value.isInitialized) {
      videoPlayerController!.pause();
      //videoPlayerController!.dispose();
      //videoPlayerController = null;
    }
    videoPlayerController = VideoPlayerController.network(videoUrl);
    videoPlayerController!
      ..setLooping(false)
      ..initialize().then((value) {
        if (isFirst!) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              videoPlayerController!.play();
              isFirst = false;
            });
          });
        } else {
          if (videoPlayerController!.value.duration ==
              videoPlayerController!.value.position) {
            videoPlayerController!.seekTo(const Duration(seconds: 0));
          }
          setState(() {
            videoPlayerController!.play();
          });
        }
      });
  }

  @override
  void dispose() {
    videoPlayerController!.pause();
    videoPlayerController!.dispose();
    videoPlayerController = null;
    WritingHelper().clear();
    super.dispose();
  }

  Widget body() {
    List<Widget> list = [];
    if (videoPlayerController!.value.isInitialized) {
      list.add(VideoPlayerChewie(videoPlayerController!));
    } else {
      list.add(const AspectRatio(
        aspectRatio: 16 / 9,
        child: SizedBox(
          width: double.infinity,
          child: Loading(),
        ),
      ));
    }

    //list.add(listWidget[currentIndex]);
    var i = currentIndex;
    list.add(WritingVideoSubPage(widget.unitWriting.videos[i], [
      i - 1, //if -1 then no prev button
      i, //current index
      i - (widget.unitWriting.videos.length - 1), // if 0 then no next button
      widget.unitWriting.videos.length,
      currentIndex,
    ], (callBackIndex, next) {
      currentIndex = next ? callBackIndex + 1 : callBackIndex - 1;
      initVideoPlayer(widget.unitWriting.videos[currentIndex].hostUrl);
      setState(() {});
    }, videoPlayerController!));

    return IntrinsicHeight(
      child: Column(mainAxisSize: MainAxisSize.max, children: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.unitTitle),
        actions: [
          UnitModuleCompletedBtn(
            moduleId: widget.moduleId,
            completeBtn: () {},
            unCompleteBtn: () {},
            isCompleted: widget.isCompleted,
            margin: const EdgeInsets.all(13),
            edgeInsets:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          ),
        ],
      ),
      backgroundColor: ColorTable.color255_255_255,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        controller: _homeController,
        physics: MediaQuery.of(context).viewInsets.bottom > 0
            ? const ClampingScrollPhysics(
                parent: NeverScrollableScrollPhysics())
            : const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: body()

            // FittedBox(
            //     fit: BoxFit.fill,
            //     child: Stack(fit: StackFit.expand, children: [
            //       Positioned(
            //         top: unitHeaderHeight,
            //         width: MediaQuery.of(context).size.width,
            //         height: MediaQuery.of(context).size.height - unitHeaderHeight,
            //         child: body(),
            //       ),
            //       Positioned(
            //         top: 0,
            //         width: MediaQuery.of(context).size.width,
            //         height: unitHeaderHeight + 8,
            //         child: UnitAppBar(
            //           widget.unitTitle,
            //           moduleId: widget.moduleId,
            //           isCompleted: widget.isCompleted,
            //         ),
            //       ),
            //     ])),
            ),
      ),
    );
  }
}

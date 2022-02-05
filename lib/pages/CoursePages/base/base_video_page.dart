import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:video_player/video_player.dart';

//https://pbhoomi190.medium.com/creating-a-base-screen-in-flutter-using-an-abstract-class-and-mixin-3c0001b74c8c

abstract class BaseVideoPage extends StatefulWidget {
  const BaseVideoPage(this.videoUrl, {Key? key}) : super(key: key);
  final String videoUrl;
}

abstract class BaseVideoPageState<Page extends BaseVideoPage>
    extends State<Page> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = widget.videoUrl.startsWith('assets')
        ? VideoPlayerController.asset(widget.videoUrl)
        : VideoPlayerController.network(widget.videoUrl);

    videoPlayerController
      ..setLooping(false)
      ..initialize().then((value) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          setState(() {
            videoPlayerController.play();
          });
        });
      });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}

mixin BaseVideoMixin<Page extends BaseVideoPage> on BaseVideoPageState<Page> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (videoPlayerController.value.isInitialized) {
      list.add(VideoPlayerChewie(videoPlayerController));
      list.add(addVerticalSpace(20));
      list.add(subtitleWidget());
    } else {
      list.add(
        SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: const Loading(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
      bottomSheet: bottomSheetWidget(),
    );
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
    return const Text('', style: TextStyle(color: Colors.black));
  }

  Widget bottomSheetWidget() {
    return const SizedBox(height: 1);
  }
}



// class SampleScreen extends BaseVideoPage {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends BaseVideoPageState<SampleScreen>
//     with BaseScreen {
//   bool isButtonTapped = false;

//   @override
//   void initState() {
//     isBackButton(false);
//     super.initState();
//   }

//   // TO GIVE THE TITLE OF THE APP BAR
//   @override
//   String appBarTitle() {
//     return "Home";
//   }


//   // THIS WILL RETURN THE BODY OF THE SCREEN
//   @override
//   Widget body() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text("HOME SCREEN BODY"),
//           Text(isButtonTapped ? "BUTTON TAPPED" : "BUTTON NOT TAPPED")
//         ],
//       ),
//     );
//   }
// }

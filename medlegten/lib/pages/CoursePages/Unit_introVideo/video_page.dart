import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/video_subtitle.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CourseUnitIntroVideoPage extends StatefulWidget {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, {Key? key})
      : super(key: key);

  final UnitIntroVideo unitIntroVideo;
  @override
  _CourseUnitIntroVideoState createState() => _CourseUnitIntroVideoState();
}

class _CourseUnitIntroVideoState extends State<CourseUnitIntroVideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.unitIntroVideo.url)
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (_videoPlayerController.value.isInitialized) {
      list.add(VideoPlayerChewie(_videoPlayerController));
      list.add(addVerticalSpace(20));
      list.add(VideoSubtitle(_videoPlayerController, widget.unitIntroVideo));
    } else {
      list.add(const Loading());
    }
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 92, left: 0, right: 0,
                  child: Column(
                  children: list,
                ),
            ),
            Positioned(
              top: 0, left: 0, right: 0,
              child: LandingHeader(100),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: colorWhite,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width*0.06,
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width*0.88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color.fromRGBO(174, 177, 239, .3), width: 1),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(120, 100, 254, 1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Color.fromRGBO(174, 177, 239, .3), width: 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
                                        child: Text('dancing', style: TextStyle(color: colorWhite, fontWeight: FontWeight.w700, fontSize: 16),),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => {  },
                                        icon: const Icon(
                                          Icons.volume_up_outlined,
                                          color: Color.fromRGBO(48, 53, 159, 1),
                                          size: 28.0,
                                        )
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: IconButton(
                                    onPressed: () => {  },
                                    icon: const Icon(
                                      Icons.bookmark_outline_sharp,
                                      color: Color.fromRGBO(48, 53, 159, 1),
                                      size: 28.0,
                                    )
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Үгийн үндэс', style: TextStyle(color: Color.fromRGBO(48, 53, 159, 1), fontSize: 14, fontWeight: FontWeight.w500),),
                                addHorizontalSpace(20),
                                Text('dance', style: TextStyle(color: Color.fromRGBO(48, 53, 159, .3), fontSize: 14, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Noun', style: TextStyle(color: Color.fromRGBO(48, 53, 159, 1), fontSize: 14, fontWeight: FontWeight.w500),),
                                Text('Бүжиг, бүжгийн ая, бүжгийн урлаг, бүжгийн цуглаан', style: TextStyle(color: Color.fromRGBO(48, 53, 159, .3), fontSize: 14, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Verb', style: TextStyle(color: Color.fromRGBO(48, 53, 159, 1), fontSize: 14, fontWeight: FontWeight.w500),),
                                Text('Бүжиглэх, бүжиглүүлэх, бүжих, гэдгдэх, гялалзах (нүд), гал хөгжих, агаагрт хурдан дээш доош хөдлөх', style: TextStyle(color: Color.fromRGBO(48, 53, 159, .3), fontSize: 14, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:                        9.8, left: 40,
                  child: Container(
                    child: Image.network(
                      "https://www.medlegten.com/static/uploads/content/image_small/polygon3.jpg",
                      fit: BoxFit.cover,
                      width: 27.56, height: 11.48,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        onClosing: () {  },
      )
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
}

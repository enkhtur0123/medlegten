import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:video_player/video_player.dart';
import 'package:collection/collection.dart';

class CourseUnitIntroVideoPage extends StatefulWidget {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, {Key? key})
      : super(key: key);

  final UnitIntroVideo unitIntroVideo;

  @override
  _CourseUnitIntroVideoPageState createState() =>
      _CourseUnitIntroVideoPageState();
}

class _CourseUnitIntroVideoPageState extends State<CourseUnitIntroVideoPage> {
  VideoPlayerController? _controller;
  int currentIndex = -1;
  bool isMon = true;
  Duration _duration = const Duration();
  FixedExtentScrollController? _controller1;

  //var videoUrl =
  //    'https://d3jhshah1dpupe.cloudfront.net/syt.mp4?Expires=1639769720&Signature=gYc8EpPjKXE4OylTLh73jsGOsMYvqfiMhDMrmBFoeeDFWT4sM99DDQvT7Ueff2i6RwkfRI4LS7OzAEqEQGgb1sFGaG4c~sqLRyHFJmhH-ibK~jawIdjjOSz1BWZPc6OlQOvDYD1wNcU6bKEqFpVKfGuju7DPkdcCCTe~NZnjAIwaEAludg9BO-SmLHAYTnj~5vWzBBEJXnhU67k512KiaKNt-buXocnh6UVbt3g1170c72SNf9FXe8Q4ysknQwoQ2rmm~7U2EC0QYw8sCx0tpJ57MoivESz1Pu2is45zz5ssx8H8tttI-aGqMiSCzvesqVDQ5lVdrsj454863i~Ehw__&Key-Pair-Id=APKAIYQFGV25I2V2NNIA';
  //var cue = '[{"start_time":"00:00:08.633","end_time":"00:00:12.466","data":[{"word":"I","value":"i","space":"0",},{"word":"saw","value":"saw","space":"0",},{"word":"you","value":"you","space":"0",},]},{"start_time":"00:00:08.633","end_time":"00:00:12.466","data": [{"word":"You","value":"you","space":"0",},{"word":"look","value":"look","space":"0",},{"word":"so","value":"so","space":"0",},{"word":"happy","value":"happy","space":"1",},{"word":",","value":"","space":"0",},{"word":"test","value":"test","space":"0",},]}]';
  // cues = jsonDecode(cue);
  // List<String> nameList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

  // Map<String, dynamic> user = json.decode('{"data": [ {"store": "AMAZON"}, {"store": "FLIPKART"},{"store": "WALMART"},{"store": "ALIBABA" },]}');
  // Map<String, dynamic> user = json.decode('{"data": [ {"name":"bulgaa","position":"ceo"}]}');
  // List<dynamic> cue = json.decode(''
  //     '['
  //     '{"index":"0","txtMon":"Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа","txtEng":"I saw you dancing in a crowded room","s_h":"0","s_m":"0","s_s":"8","s_ms":"633"},'
  //     '{"index":"1","txtMon":"Намайг байхгүйд чи үнэхээр жаргалтай харагдаж байна","s_h":"0","s_m":"0","s_s":"12","s_ms":"500"},'
  //     '{"index":"2","txtMon":"Гэвч тэгэхэд чамайг гэнэт олж харахыг минь чи харсан","s_h":"0","s_m":"0","s_s":"16","s_ms":"633"}'
  //     ']');

  @override
  void initState() {
    super.initState();

    _controller1 = FixedExtentScrollController();

    _controller = VideoPlayerController.network(widget.unitIntroVideo.url);

    _controller!
      ..addListener(() => setState(() {
            _duration = _controller!.value.duration;
            var idx = widget.unitIntroVideo.cues.firstWhereOrNull((element) =>
                getDuration(element.startTime) <= _duration &&
                getDuration(element.endTime) > _duration);
            print(_duration);
            if (idx != null) {
              print(idx);
              _controller1!.animateToItem(int.parse(idx.cueId),
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.linear);
            }
          }))
      ..setLooping(false)
      ..initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoPlayerWidget(controller: _controller!),
          addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addHorizontalSpace(10),
              OutlinedButton(
                onPressed: () {
                  isMon = true;
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: ColorTable.color48_53_159,
                ),
                child: const Text(
                  'Mon',
                  style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Roboto'),
                ),
              ),
              addHorizontalSpace(10),
              OutlinedButton(
                onPressed: () {
                  isMon = false;
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: ColorTable.color48_53_159,
                ),
                child: const Text(
                  'Eng',
                  style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Roboto'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 180,
              child: ListWheelScrollView(
                physics:
                    const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
                itemExtent: 60,
                // squeeze: 0.7,
                useMagnifier: true,
                magnification: 1.0, // голын item нь илүү том харагдах
                diameterRatio: 5, // item-ийг налалттай биш өнцгөөр харуулна
                perspective: 0.001,
                controller: _controller1,
                onSelectedItemChanged: (index) {
                  // print(index)
                  //if (prevIndex == index) {
                  currentIndex = index;
                  _controller!.seekTo(
                      getDuration(widget.unitIntroVideo.cues[index].startTime));
                  //} else {
                  //   prevIndex = index;
                  // }
                  // _controller.play()
                },
                children: <Widget>[
                  ...widget.unitIntroVideo.cues.map((cue) {
                    return Text(
                      isMon ? cue.fromText : cue.toText,
                      style: TextStyle(
                          color: currentIndex == int.parse(cue.cueId)
                              ? colorBlack
                              : Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
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

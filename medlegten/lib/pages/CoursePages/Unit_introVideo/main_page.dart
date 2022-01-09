import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:video_player/video_player.dart';
import 'dart:convert';

class CourseUnitIntroVideoPage extends StatefulWidget {
  @override
  _CourseUnitIntroVideoPageState createState() => _CourseUnitIntroVideoPageState();
}

class _CourseUnitIntroVideoPageState extends State<CourseUnitIntroVideoPage> {
  late VideoPlayerController _controller;
  var videoUrl = 'https://d3jhshah1dpupe.cloudfront.net/syt.mp4?Expires=1639769720&Signature=gYc8EpPjKXE4OylTLh73jsGOsMYvqfiMhDMrmBFoeeDFWT4sM99DDQvT7Ueff2i6RwkfRI4LS7OzAEqEQGgb1sFGaG4c~sqLRyHFJmhH-ibK~jawIdjjOSz1BWZPc6OlQOvDYD1wNcU6bKEqFpVKfGuju7DPkdcCCTe~NZnjAIwaEAludg9BO-SmLHAYTnj~5vWzBBEJXnhU67k512KiaKNt-buXocnh6UVbt3g1170c72SNf9FXe8Q4ysknQwoQ2rmm~7U2EC0QYw8sCx0tpJ57MoivESz1Pu2is45zz5ssx8H8tttI-aGqMiSCzvesqVDQ5lVdrsj454863i~Ehw__&Key-Pair-Id=APKAIYQFGV25I2V2NNIA';
  //var cue = '[{"start_time":"00:00:08.633","end_time":"00:00:12.466","data":[{"word":"I","value":"i","space":"0",},{"word":"saw","value":"saw","space":"0",},{"word":"you","value":"you","space":"0",},]},{"start_time":"00:00:08.633","end_time":"00:00:12.466","data": [{"word":"You","value":"you","space":"0",},{"word":"look","value":"look","space":"0",},{"word":"so","value":"so","space":"0",},{"word":"happy","value":"happy","space":"1",},{"word":",","value":"","space":"0",},{"word":"test","value":"test","space":"0",},]}]';
  // cues = jsonDecode(cue);
  // List<String> nameList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

  // Map<String, dynamic> user = json.decode('{"data": [ {"store": "AMAZON"}, {"store": "FLIPKART"},{"store": "WALMART"},{"store": "ALIBABA" },]}');
  // Map<String, dynamic> user = json.decode('{"data": [ {"name":"bulgaa","position":"ceo"}]}');
  List<dynamic> cue = json.decode(''
      '['
        '{"index":"0","text":"Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа","s_h":"0","s_m":"0","s_s":"8","s_ms":"633"},'
        '{"index":"1","text":"Намайг байхгүйд чи үнэхээр жаргалтай харагдаж байна","s_h":"0","s_m":"0","s_s":"12","s_ms":"500"},'
        '{"index":"2","text":"Гэвч тэгэхэд чамайг гэнэт олж харахыг минь чи харсан","s_h":"0","s_m":"0","s_s":"16","s_ms":"633"}'
      ']');

  List<String> nameList = [
    "Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа",
    "Намайг байхгүйд чи үнэхээр жаргалтай харагдаж байна	",
    "Гэвч тэгэхэд чамайг гэнэт олж харахыг минь чи харсан	",
    "Нүднээс чинь ганц дусал нулимс урссан",
    "Яагаад зугтсанаа би мэдэхгүй юм",
    "Зугтахдаа би чамайг уйлуулдаг",
    "Яагаад чиний зүрхийг шархлуулсаныг чи асууж болох л байсан	"
  ];


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(controller: _controller),
            addVerticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                child: ListWheelScrollView(
                    physics: FixedExtentScrollPhysics(),  // auto байрлалаа олоод зогсоно
                    itemExtent: 60,
                    // squeeze: 0.7,
                    useMagnifier: true,
                    magnification: 1.0, // голын item нь илүү том харагдах
                    diameterRatio: 5, // item-ийг налалттай биш өнцгөөр харуулна
                    perspective: 0.001,
                    onSelectedItemChanged: (index) => {
                      // print(index)
                      _controller.seekTo(Duration(hours: int.parse(cue[index]['s_h']), minutes: int.parse(cue[index]['s_m']), seconds: int.parse(cue[index]['s_s']), milliseconds: int.parse(cue[index]['s_ms']))),
                      // _controller.play()
                    },
                    children: <Widget>[
                      ...cue.map((cue) {
                        return  Text(cue['text'], style: TextStyle(color: colorBlack, fontSize: 18, fontWeight: FontWeight.w400), textAlign: TextAlign.center,);
                      })
                    ])
              ),
            )
          ],
        ),
    );
  }
}
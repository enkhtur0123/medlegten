import 'package:medlegten/models/Unit/unit_introduction_cue.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/repositories/repository.dart';

class UnitRepository {
  //moduleTypeId = 1
  Future<UnitIntroVideo?> getUnitIntroVideo(String moduleId) async {
    try {
      // final response =
      //     await dioRepository.instance.get('Course/SelfQuiz/History');
      // final res = json.decode('$response');
      // if (res['isSuccess']) {
      //   return QuizHistory.fromJson(res['quizDetial']);
      // } else {
      //   dioRepository.snackBar(res['resultMessage']);
      //   return null;
      // }

      // '{"index":"0","txtMon":"Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа","txtEng":"I saw you dancing in a crowded room","s_h":"0","s_m":"0","s_s":"8","s_ms":"633"},'
      //'{"index":"1","txtMon":"Намайг байхгүйд чи үнэхээр жаргалтай харагдаж байна","s_h":"0","s_m":"0","s_s":"12","s_ms":"500"},'
      //'{"index":"2","txtMon":"Гэвч тэгэхэд чамайг гэнэт олж харахыг минь чи харсан","s_h":"0","s_m":"0","s_s":"16","s_ms":"633"}'

      return UnitIntroVideo(
          '1',
          'Intro video of Unit 1',
          'https://d3jhshah1dpupe.cloudfront.net/syt.mp4?Expires=1639769720&Signature=gYc8EpPjKXE4OylTLh73jsGOsMYvqfiMhDMrmBFoeeDFWT4sM99DDQvT7Ueff2i6RwkfRI4LS7OzAEqEQGgb1sFGaG4c~sqLRyHFJmhH-ibK~jawIdjjOSz1BWZPc6OlQOvDYD1wNcU6bKEqFpVKfGuju7DPkdcCCTe~NZnjAIwaEAludg9BO-SmLHAYTnj~5vWzBBEJXnhU67k512KiaKNt-buXocnh6UVbt3g1170c72SNf9FXe8Q4ysknQwoQ2rmm~7U2EC0QYw8sCx0tpJ57MoivESz1Pu2is45zz5ssx8H8tttI-aGqMiSCzvesqVDQ5lVdrsj454863i~Ehw__&Key-Pair-Id=APKAIYQFGV25I2V2NNIA',
          [
            UnitIntroCueParagraph(
                '0',
                '00:00:08.633',
                '00:00:12.499',
                'MON',
                '1. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room.', [
              UnitIntroCueWord('1', '0', 'I', 'i', '0'),
              UnitIntroCueWord('2', '0', 'saw', 'saw', '0'),
              UnitIntroCueWord('3', '0', 'you', 'you', '0'),
              UnitIntroCueWord('4', '0', 'dancing', 'dancing', '0'),
              UnitIntroCueWord('5', '0', 'in', 'in', '0'),
              UnitIntroCueWord('6', '0', 'a', 'a', '0'),
              UnitIntroCueWord('7', '0', 'crowded', 'crowded', '0'),
              UnitIntroCueWord('8', '0', 'room', 'room', '1'),
              UnitIntroCueWord('9', '0', '.', '', '0'),
            ]),
            UnitIntroCueParagraph(
                '1',
                '00:00:12.500',
                '00:00:16.632',
                'MON',
                '2. Намайг байхгүйд чи үнэхээр жаргалтай харагдаж байна',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '2',
                '00:00:16.633',
                '00:00:18.499',
                'MON',
                '3. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '3',
                '00:00:18.500',
                '00:00:20.499',
                'MON',
                '4. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '4',
                '00:00:20.500',
                '00:00:22.499',
                'MON',
                '5. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '5',
                '00:00:22.500',
                '00:00:24.499',
                'MON',
                '6. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '6',
                '00:00:24.500',
                '00:00:26.499',
                'MON',
                '7. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '7',
                '00:00:26.500',
                '00:00:28.499',
                'MON',
                '8. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '8',
                '00:00:28.500',
                '00:00:30.499',
                'MON',
                '9. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '9',
                '00:00:30.500',
                '00:00:32.499',
                'MON',
                '10. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
            UnitIntroCueParagraph(
                '10',
                '00:00:32.500',
                '00:00:34.499',
                'MON',
                '11. Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа',
                'ENG',
                '0',
                'I saw you dancing in a crowded room', []),
          ]);
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }
}

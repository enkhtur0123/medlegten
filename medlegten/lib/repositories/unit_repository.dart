import 'dart:convert';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/repositories/repository.dart';

class UnitRepository {
  //moduleTypeId =
  Future<UnitIntroVideo?> getUnitIntroVideo(String moduleId) async {
    try {
      final response =
          await dioRepository.instance.get('Course/UnitModule/$moduleId/1');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        return UnitIntroVideo.fromJson(res['introVideo']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }
}

import 'package:medlegten/models/video/category.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class VideoRepository {
  Future<dynamic> getCategory({String? type = "0"}) async {
    try {
      final res = await HttpHelper().getUrl(url: 'ppv/Category/$type');
      if (res['isSuccess']) {
        var list = res['categories'] as List;
        return list.map((i) => Category.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }
}

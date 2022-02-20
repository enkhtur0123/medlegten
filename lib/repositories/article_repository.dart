import 'package:medlegten/models/article/article.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class ArticleRepository {
  Future<List<Article>> getArticle() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Article');
      if (res['isSuccess']) {
        var list = res['pageQueue'] as List;
        var articles = list.map((i) => Article.fromJson(i)).toList();
        return articles;
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: (res['resultMessage']));
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
     throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }
}

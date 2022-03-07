import 'package:medlegten/models/article/article.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class ArticleRepository {
  Future<List<ArticleItem>> searchArticle(
      {String? searchValue, int? pageNumber, int? pageSize}) async {
    try {
      final res = await HttpHelper().getUrl(url: 'Article/Search/$searchValue');
      if (res['isSuccess']) {
        var list = res['articles'] as List;
        var articles = list.map((i) => ArticleItem.fromJson(i)).toList();
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

  Future<List<ArticleItem>> getAllArticle(
      {String? typeId, int? pageNumber, int? pageSize}) async {
    try {
      final res = await HttpHelper().getUrl(
          url: 'Article/All/$typeId?pageNumber=$pageNumber&pageSize=$pageSize');
      if (res['isSuccess']) {
        var list = res['articles'] as List;
        var articles = list.map((i) => ArticleItem.fromJson(i)).toList();
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

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/article/article.dart';
import 'package:medlegten/pages/BlogPage/article_horizontal_page.dart';
import 'package:medlegten/repositories/article_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/my_textfield.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';

// ignore: must_be_immutable
class BlogPage extends HookWidget {
  BlogPage({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  FocusNode? focusNode = FocusNode();
  String searchValue = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ArticleRepository().getArticle(),
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: const Color(0xffBAB0FF).withOpacity(0.5)),
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: MyTextField(
                    formKey: _formKey,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length >= 3) {
                        return "";
                      } else {
                        return null;
                      }
                    },
                    focusNode: focusNode,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    suffix: GestureDetector(
                      onTap: () {
                        searchValue = base64.encode(
                            utf8.encode(controller.value.text.toString()));
                         validateSearchValue(context: context);
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    labelText: "Хайх",
                    controller: controller,
                    onChanged: (value) {
                      searchValue = base64.encode(utf8.encode(value));
                    },
                    labelColor: Colors.white,
                    isBordered: false,
                    filled: true,
                    onSubmitted: (value) {
                      searchValue = base64.encode(utf8.encode(value));
                      validateSearchValue(context: context);
                    },
                  ),
                ),
                Expanded(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: snapshot.data!.map((e) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      child: ArticleHorizontalPage(
                        articles: e.articles,
                        typeId: e.typeId,
                        typeName: e.typeName,
                      ),
                    );
                  }).toList(),
                )),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }

  validateSearchValue({BuildContext? context}) {
    if (controller.value.text.toString().length >= 3) {
      AutoRouter.of(context!).push(
        ArticleVerticalRoute(
            title: controller.value.text.toString(),
            isArticleSearch: true,
            searchValue: searchValue),
      );
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(MySnackBar(
        text: "3 тэмдэгтээс дээш байх ёстой",
      ));
    }
  }
}

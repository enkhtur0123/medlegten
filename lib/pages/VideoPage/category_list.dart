import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlegten/models/video/category.dart';
import 'package:medlegten/themes/style.dart';

// ignore: must_be_immutable
class CategoryPage extends HookWidget {
  CategoryPage({Key? key, this.category, this.onTap}) : super(key: key);
  List<Category>? category;
  Function(String categoryId, String categoryName)? onTap;

  @override
  Widget build(BuildContext context) {
    var selectedId = useState("");
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 0, top: 20),
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: category!.map((e) {
          return GestureDetector(
            onTap: () {
              selectedId.value = e.id!;
              onTap!(e.id!, e.name!);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedId.value == e.id ? const Color(0xff7864FE) : Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(color: secondaryColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.network(
                    e.imgUrl!,
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    e.name!,
                    style: TextStyle(
                        fontSize: 10,
                        color: selectedId.value == e.id ? Colors.white : const Color(0xff343C44),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

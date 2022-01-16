import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/wide_button.dart';

class AgePage extends HookWidget {
  //DateTime selectedDate = DateTime.now();

  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double paddingTop = 80.0;
    const double paddingRight = 30.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/background_age.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: paddingTop, right: paddingRight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addHorizontalSpace(10),
                    Text(
                      'алгасах',
                      style: TEXT_THEME_DEFAULT.headline1,
                    )
                  ],
                ),
              ),
              addVerticalSpace(80),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  'Та төрсөн он сар өдрөө оруулна уу',
                  style: TEXT_THEME_DEFAULT.headline2,
                ),
              ),
              addVerticalSpace(10),
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  style: const TextStyle(color: colorPrimary),
                  decoration: InputDecoration(
                      hintText: 'Он сар өдөр',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: colorPrimary, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: colorPrimary, width: 1),
                      ),
                      suffixIcon: const Icon(
                        Icons.date_range_outlined,
                        color: colorPrimary,
                      ),
                      filled: true,
                      fillColor: colorWhite),
                ),
              ),
              addVerticalSpace(250),
              WideButton('Үргэлжлүүлэх', colorSecondary, colorWhite, () {}),
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Таны оруулсан хувийн мэдээлэл нь цаашид зөвхөн таны сургалтын хөтөлбөрт зориулагдан ашиглагдах болно',
                  style: TEXT_THEME_DEFAULT.headline3,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

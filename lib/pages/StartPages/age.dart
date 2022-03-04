import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AgePage extends HookConsumerWidget {
  //DateTime selectedDate = DateTime.now();

  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double paddingTop = 80.0;
    const double paddingRight = 30.0;
    final textController = useTextEditingController();

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
                    InkWell(
                      onTap: () {
                        ref
                            .read(authProvider.notifier)
                            .changeStatus(AuthState.Authorized);
                      },
                      child: Text(
                        'Алгасах',
                        style: TEXT_THEME_DEFAULT.headline1,
                      ),
                    ),
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
                  child:
                      // SfDateRangePicker(
                      //     //onSelectionChanged: _onSelectionChanged,
                      //     selectionMode: DateRangePickerSelectionMode.single,
                      //     initialSelectedRange: PickerDateRange(
                      //         DateTime.now().subtract(const Duration(days: 4)),
                      //         DateTime.now().add(const Duration(days: 3)))),
                      TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2018, 3, 5),
                                maxTime: DateTime(2019, 6, 7),
                                onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              print('confirm $date');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: const Text(
                            'show date time picker (Chinese)',
                            style: TextStyle(color: Colors.blue),
                          ))
                  //     TextField(
                  //   controller: textController,
                  //   style: const TextStyle(color: colorPrimary),
                  //   decoration: InputDecoration(
                  //       hintText: 'Он сар өдөр',
                  //       hintStyle: const TextStyle(color: Colors.grey),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         borderSide:
                  //             const BorderSide(color: colorPrimary, width: 1),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         borderSide:
                  //             const BorderSide(color: colorPrimary, width: 1),
                  //       ),
                  //       suffixIcon: const Icon(
                  //         Icons.date_range_outlined,
                  //         color: colorPrimary,
                  //       ),
                  //       filled: true,
                  //       fillColor: colorWhite),
                  // ),
                  ),
              addVerticalSpace(250),
              WideButton('Үргэлжлүүлэх', colorSecondary, colorWhite, () {
                if (textController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    MySnackBar(
                      text: "Огноо оруулна уу!",
                    ),
                  );
                }
              }),
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

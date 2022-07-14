import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.hour);
    setMiddleIndex(this.currentTime.minute);
    setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
            currentLeftIndex(), currentMiddleIndex(), currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day,
            currentLeftIndex(), currentMiddleIndex(), currentRightIndex());
  }
}

class AgePage extends HookConsumerWidget {
  AgePage({Key? key}) : super(key: key);

  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double paddingTop = 80.0;
    const double paddingRight = 30.0;
    final selectedDate = useState<String>('Төрсөн он сар өдөр');
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
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: OutlinedButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime(now.year - 6, now.month, now.day),
                        theme: const DatePickerTheme(
                            headerColor: Colors.black12,
                            backgroundColor: Colors.white,
                            itemStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onChanged: (date) {
                      selectedDate.value =
                          DateFormat("yyyy-MM-dd").format(date).toString();
                    }, onConfirm: (date) {
                      selectedDate.value =
                          DateFormat("yyyy-MM-dd").format(date).toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Row(children: [
                    Text(selectedDate.value,
                        style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    const Icon(
                      Icons.date_range_outlined,
                      color: colorPrimary,
                    )
                  ]),
                  style: OutlinedButton.styleFrom(
                    //elevation: 0.5,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        color: colorPrimary,
                        width: 1,
                        style: BorderStyle.solid),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
              ),
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Хэрэглэгчийн насны  мэдээлэл нь насны бүлгийн сонирхолд нийцсэн контент санал болгоход ашиглагдах болно',
                  style: TEXT_THEME_DEFAULT.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              WideButton('Үргэлжлүүлэх', colorSecondary, colorWhite, () {
                if (selectedDate.value == 'Төрсөн он сар өдөр') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    MySnackBar(
                      text: "Огноо оруулна уу!",
                    ),
                  );
                } else {
                  LoginRepository().setBirth(selectedDate.value).then((value) =>
                      ref
                          .read(authProvider.notifier)
                          .changeStatus(AuthState.Authorized));
                }
              }),
              addVerticalSpace(50),
            ],
          )
        ],
      ),
    );
  }

  void _showMaterialDialog(
      BuildContext context, ValueNotifier<String> selectedDateNotifier) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          DateTime selectedDate = DateTime.now();
          return AlertDialog(
            content: SizedBox(
              height: 300,
              width: 300,
              child: SfDateRangePicker(
                onSelectionChanged: (args) {
                  if (args.value is DateTime) {
                    selectedDate = args.value;
                  }
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  child: const Text(
                    "Сонгох",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    selectedDateNotifier.value =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }
}

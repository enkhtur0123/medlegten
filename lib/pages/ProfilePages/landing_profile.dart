import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Starting/active_service.dart';
import 'package:medlegten/models/Starting/muser_info.dart';
import 'package:medlegten/models/video/mile_stone.dart';
import 'package:medlegten/pages/ProfilePages/level_widget.dart';
import 'package:medlegten/pages/ProfilePages/mile_stone.dart';
import 'package:medlegten/pages/ProfilePages/report_item.dart';
import 'package:medlegten/providers/app_provider.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/date_time_formatter.dart';
import 'package:medlegten/utils/global.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';
import 'package:medlegten/widgets/dialog/confirm_dialog.dart';
import 'package:medlegten/widgets/dialog/custom_popup.dart';
import 'package:medlegten/widgets/loader.dart';
import '../../utils/hex_color.dart';
import 'report_items.dart';

// ignore: must_be_immutable
class LandingProfile extends HookConsumerWidget {
  LandingProfile({Key? key}) : super(key: key);

  final TextStyle textStyle = const TextStyle(color: Colors.black);
  MUserInfo? userInfo;
  Color? currentStageColor;
  MileStone? mileStone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> wordCount = ref.watch(wordCountProvider);
    userInfo = ref.read(authProvider.notifier).userInfo;
    var notifier = useState(false);
    useEffect(() {
      VideoRepository().getMileStone().then((value) {
        currentStageColor = HexColor(value.mileStone!
            .singleWhere((element) => element.current == "1")
            .color!);
        mileStone = value;
        notifier.value = !notifier.value;
        notifier.dispose();
      });
      return null;
    }, []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserImageWithName(ref: ref),
              const SizedBox(
                height: 30,
              ),
              mileStone != null
                  ? MileStonePage(
                      mileStone: mileStone,
                      isLast: mileStone!.mileStone!.indexOf(
                              mileStone!.mileStone!.singleWhere(
                                  (element) => element.current == "1")) ==
                          mileStone!.mileStone!.length - 1,
                      currentIndex: mileStone!.mileStone!.indexOf(
                        mileStone!.mileStone!
                            .singleWhere((element) => element.current == "1"),
                      ),
                    )
                  : const SizedBox(
                      height: 30,
                      child: Loading(),
                    ),
              const SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: const Color(0xffC7C9D9).withOpacity(0.2),
              ),
              FutureBuilder(
                  future: LoginRepository().getActiveService(),
                  builder:
                      (context, AsyncSnapshot<List<ActiveService>> snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Үйлчилгээний хугацаа",
                            style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: snapshot.data!.map((e) {
                              return activeServiceItem(
                                  activeService: e, context: context);
                            }).toList(),
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: CustomOutlinedButton(
                  height: 50,
                  color: const Color(0xff7864FE),
                  text: "Гарах",
                  onTap: () {
                    ref.read(authProvider.notifier).logoff();
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // ignore: invalid_use_of_protected_member
              Text(
                "Апп хувилбар  " + AppProperties.version,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmDialog(
                          isAlert: true,
                          text:
                              "Та өөрийн хэрэглэгчийн бүртгэл устгаснаар суралцсан хичээлийн түүх, худалдан авсан үйлчилгээ болон түүх, сошиал хаягтай холбоотой мэдээллүүд бүрэн устах бөгөөд дахин сэргээгдэх боломжгүйг анхаарна уу.",
                        );
                      }).then((value) async {
                    if (value != null && value) {
                      try {
                        LoadingIndicator(context: context)
                            .showLoadingIndicator();
                        await LoginRepository().cancelAccount();
                        LoadingIndicator(context: context)
                            .hideLoadingIndicator();
                        ref.read(authProvider.notifier).logoff();
                      } catch (Ex) {
                        LoadingIndicator(context: context)
                            .hideLoadingIndicator();
                      }
                    }
                  });
                },
                child: const Text(
                  "Хэрэглэгчийн бүртгэл устгах ",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget activeServiceItem(
      {ActiveService? activeService, BuildContext? context}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            activeService!.productName,
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              color: colorPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            MyDateTimeFormatter(date: activeService.expireDate, noTime: true)
                .toDateTime()
                .toString()
                .split(" ")[0],
            style: Theme.of(context!).textTheme.subtitle1!.copyWith(
                  color: const Color(0xffA8AFE5),
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }

  ///Report Item
  Widget getReportItemWidget({ReportItem? e}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(e!.imgUrl!),
        fit: BoxFit.contain,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          e.iconWidget ??
              Icon(
                e.iconData,
                color: e.iconColor ?? Colors.white,
              ),
          const SizedBox(
            height: 12,
          ),
          Text(
            e.title!,
            style: TextStyle(
                color: e.titleColor ?? Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 10),
          ),
          Text(
            e.body!,
            style: TextStyle(
                color: e.bodyColor ?? Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: e.bodyFontWeight ?? FontWeight.bold,
                fontSize: e.bodyFontSize ?? 30),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UserImageWithName({WidgetRef? ref, ValueNotifier<bool>? notifier}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: currentStageColor != null
                      ? currentStageColor!
                      : Colors.transparent,
                  width: 3),
            ),
            child: SizedBox(
              width: 120,
              height: 120,
              child: CachedNetworkImage(
                imageUrl: userInfo!.profileUrl ??
                    'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg',
                placeholder: (context, url) => CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  radius: 26,
                ),
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 26,
                  backgroundImage: image,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    userInfo?.firstName ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.file_copy_outlined,
                    color: Color(0xff30359F),
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Хэрэглэгчийн дугаар: ${userInfo?.userId ?? ""}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 50,
              ),
              mileStone != null
                  ? LevelWidget(
                      mileStone: mileStone,
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

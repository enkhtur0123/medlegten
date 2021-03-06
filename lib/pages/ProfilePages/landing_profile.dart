import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Starting/muser_info.dart';
import 'package:medlegten/pages/ProfilePages/report_item.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/widgets/TextButton.dart';
import 'report_items.dart';

// ignore: must_be_immutable
class LandingProfile extends ConsumerWidget {
  LandingProfile({Key? key}) : super(key: key);

  final TextStyle textStyle = const TextStyle(color: Colors.black);
  MUserInfo? userInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    userInfo = ref.read(authProvider.notifier).userInfo;
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
                height: 15,
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: const Color(0xffC7C9D9).withOpacity(0.2),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "My reports",
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10),
                childAspectRatio: 16 / 14,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: items.map((e) {
                  return getReportItemWidget(e: e);
                }).toList(),
              ),
              // WideButton(
              //   "Log off",
              //   ColorTable.color120_100_254,
              //   ColorTable.color255_255_255,
              //   () {
              //     ref.read(authProvider.notifier).logoff();
              //   },
              // ),
              Text(
                "?????????? ??????????",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
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
  Widget UserImageWithName({WidgetRef? ref}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
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
            )),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              size: 13,
            )
          ],
        ),
        TextButtonWidget(text: "Change profile", onTap: () {})
      ],
    );
  }
}

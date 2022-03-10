// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/providers/appbar_provider.dart';
import 'package:medlegten/themes/style.dart';

// ignore: must_be_immutable
class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  String? text;
  WidgetRef? ref;
  CustomAppBar(
      {Key? key, this.text, this.ref})
      : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CustomAppBarState();
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ref!.read(appbarProvider.notifier).appBarState.height!);
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  bool? isRichText;
  double? height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      height: ref.read(appbarProvider.notifier).appBarState.height,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 25, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/svg/logo.svg"),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "LINGOS",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Stack(children: [
                      const Icon(Icons.notifications),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              ),
                        ),
                      )
                    ])
                  ],
                ),
              ),
              Text(
                ref.read(appbarProvider.notifier).appBarState.text??"",
                style: const TextStyle(
                    color: Color(0xffC7C9D9),
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

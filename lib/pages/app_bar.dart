// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/themes/style.dart';

// ignore: must_be_immutable
class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final Widget? child;
  final double height;
  bool? isRichText;
  String? text1;
  String? text2;
  String? text3;
  CustomAppBar({
    Key? key,
    this.child,
    this.height = kToolbarHeight,
    this.isRichText = false,
    this.text1 = "",
    this.text2 = "",
    this.text3,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CustomAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      height: Size.fromHeight(widget.height).height,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 25, top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/svg/logo.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "МЭДЛЭГТЭН",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(Icons.notifications_active)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          widget.isRichText!
              ? RichText(
                  maxLines: 2,
                  text: TextSpan(
                    text: widget.text1,
                    style: const TextStyle(
                        color: Color(0xffC7C9D9),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.text2,
                      ),
                      TextSpan(
                          text: widget.text3,
                          style: const TextStyle(
                              color: Color(0xff1AE5EF),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              : Text(
                  widget.text1!,
                  style: const TextStyle(
                      color: Color(0xffC7C9D9),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
        ],
      ),
    );
  }
}

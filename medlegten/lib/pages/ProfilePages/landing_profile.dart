import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/utils/app_router.dart';

class LandingProfile extends ConsumerWidget {
  const LandingProfile({Key? key}) : super(key: key);

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: WideButton(
          "Log off",
          ColorTable.color120_100_254,
          ColorTable.color255_255_255,
          () {
            ref.read(authProvider.notifier).logoff();
            AutoRouter.of(context).push(const LoginRoute());
          },
        ),
      ),
    );
  }
}

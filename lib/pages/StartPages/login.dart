import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/pages/StartPages/apple_login.dart';
import 'package:medlegten/pages/StartPages/facebook_login.dart';
import 'package:medlegten/pages/StartPages/google_login.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/utils/app_router.dart';

import 'guest_login.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final _authState = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/backroundlogin.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              // child: SingleChildScrollView(
                child: 
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Spacer(flex: 5),
                  Image.asset("assets/logo/vertical_logo.png",height: 100,filterQuality: FilterQuality.high),
                  const Spacer(flex: 5),
                  const FacebookLogin(),
                  const SizedBox(height: 10),
                  const GoogleLogin(),
                  const SizedBox(height: 10),
                  Platform.isIOS ? const AppleLogin():const SizedBox(),
                    const SizedBox(height: 10),
                    const GuestLogin(),
                  const Spacer(flex: 1),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Та манай ',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1)),
                      children: [
                        TextSpan(
                            text: 'үйлчилгээний нөхцөл',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context).push(
                                    WebViewRoute(webUrl: 'https://www.lingos.mn/terms.html'));
                              },
                            style: TextStyle(
                                color: ColorTable.color120_100_254,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  addVerticalSpace(5),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: ' болон ',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1)),
                      children: [
                        TextSpan(
                            text: 'нууцлалын бодлоготой',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context).push(
                                    WebViewRoute(webUrl: 'https://www.lingos.mn/privacy.html'));
                              },
                            style: TextStyle(
                                color: ColorTable.color120_100_254,
                                decoration: TextDecoration.underline)),
                        const TextSpan(
                            text: ' танилцана уу.',
                            style: TextStyle(
                                color: Color.fromRGBO(130, 130, 130, 1))),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
                ),
              // ),
            ),
          ),
          Center(
            child: _authState == AuthState.Authorizing
                ? const Loading()
                : Container(),
          ),
        ],
      ),
    );
  }
}

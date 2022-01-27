import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/pages/StartPages/facebook_login.dart';
import 'package:medlegten/pages/StartPages/google_login.dart';
import 'package:medlegten/pages/StartPages/medlegten_vertical.dart';
import 'package:medlegten/providers/auth_provider.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Spacer(flex: 5),
                  const MedlegtenLogoVertical(
                    TextStyle(
                      color: Color.fromRGBO(48, 53, 159, 1),
                      fontFamily: 'Poppins-SemiBold',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                    width: 103.76,
                  ),
                  const Spacer(flex: 5),
                  const FacebookLogin(),
                  const SizedBox(height: 10),
                  const GoogleLogin(),
                  const Spacer(flex: 1),
                  RichText(
                    text: const TextSpan(
                      text: 'By signing up you accept the',
                      style: TextStyle(color: Color.fromRGBO(130, 130, 130, 1)),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(color: ColorTable.color120_100_254),
                        children: [
                          const TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                  color: Color.fromRGBO(130, 130, 130, 1))),
                          TextSpan(
                              text: ' Privacy Policy',
                              style:
                                  TextStyle(color: ColorTable.color120_100_254))
                        ]),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
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

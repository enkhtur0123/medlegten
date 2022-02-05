import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/providers/auth_provider.dart';

class FacebookLogin extends ConsumerWidget {
  const FacebookLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authProvider);
    return Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        width: double.infinity,
        child: SignInButton(
          Buttons.FacebookNew,
          padding: const EdgeInsets.all(15),
          elevation: 4,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          onPressed: () {
            if (_authState != AuthState.Authorized) {
              WidgetsBinding.instance?.addPostFrameCallback(
                  (_) => ref.read(authProvider.notifier).loginFacebook());
            }
          },
        ));
  }
}

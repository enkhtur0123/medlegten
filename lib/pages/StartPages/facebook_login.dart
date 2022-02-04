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

    // return OutlinedButton(
    //   child: InkWell(
    //     onTap: () async {
    //       if (_authState == AuthState.Unauthorized) {
    //         ref.read(authProvider.notifier).loginFacebook();
    //       }
    //     },
    //     child: Container(
    //       height: 55,
    //       margin: const EdgeInsets.symmetric(vertical: 3),
    //       alignment: Alignment.centerLeft,
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(23),
    //         border: Border.all(
    //             color: _authState == AuthState.Authorizing
    //                 ? !ref.read(authProvider.notifier).isGoogle
    //                     ? Colors.grey
    //                     : Theme.of(context).colorScheme.secondary
    //                 : Theme.of(context).colorScheme.secondary,
    //             width: 0.4),
    //       ),
    //       child: _authState == AuthState.Authorizing
    //           ? ref.read(authProvider.notifier).isGoogle
    //               ? Loading(20)
    //               : const Padding(
    //                   padding: EdgeInsets.only(left: 80),
    //                   child: Text('FACEBOOK ЭРХЭЭР НЭВТРЭХ',
    //                       style: TextStyle(
    //                           color: Colors.grey, fontWeight: FontWeight.w300)),
    //                 )
    //           : const Padding(
    //               padding: EdgeInsets.only(left: 80),
    //               child: Text('FACEBOOK ЭРХЭЭР НЭВТРЭХ',
    //                   style: TextStyle(
    //                       color: Colors.black, fontWeight: FontWeight.w300)),
    //             ),
    //     ),
    //   ),
    //   onPressed: () {
    //     ref.read(authProvider.notifier).loginFacebook();
    //   },
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/providers/auth_provider.dart';

class GoogleLogin extends ConsumerWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authProvider);
    return WideButton(
      'Login in with Google',
      ColorTable.color255_255_255,
      const Color.fromRGBO(48, 48, 48, 1),
      () async {
        if (_authState == AuthState.Unauthorized) {
          WidgetsBinding.instance?.addPostFrameCallback(
              (_) => ref.read(authProvider.notifier).loginGoogle());
        }
      },
      imgPath: 'assets/img/google.png',
    );
    // return OutlinedButton(
    //   child: InkWell(
    //     onTap: () async {
    //       if (_authState == AuthState.Unauthorized) {
    //         ref.read(authProvider.notifier).loginGoogle();
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
    //                   child: Text('GOOGLE ЭРХЭЭР НЭВТРЭХ',
    //                       style: TextStyle(
    //                           color: Colors.grey, fontWeight: FontWeight.w300)),
    //                 )
    //           : const Padding(
    //               padding: EdgeInsets.only(left: 80),
    //               child: Text('GOOGLE ЭРХЭЭР НЭВТРЭХ',
    //                   style: TextStyle(
    //                       color: Colors.black, fontWeight: FontWeight.w300)),
    //             ),
    //     ),
    //   ),
    //   onPressed: () {
    //     ref.read(authProvider.notifier).loginGoogle();
    //   },
    // );
  }
}

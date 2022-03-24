import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/providers/auth_provider.dart';
class AppleLogin extends ConsumerWidget {
  const AppleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authProvider);
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: SignInButton(
        Buttons.Apple,
        padding: const EdgeInsets.all(16),
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        onPressed: () async {
           if (_authState != AuthState.Authorized) {
              WidgetsBinding.instance?.addPostFrameCallback(
                  (_) => ref.read(authProvider.notifier).loginApple());
            }
        },
      ),
    );
  }
}

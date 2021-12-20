import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/version.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'medlegten_vertical.dart';

class InitializationPage extends ConsumerWidget {
  const InitializationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginNotifierProvider);

    const str = 'Medlegten app v1.0';

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MedlegtenLogoVertical(
                  TextStyle(
                    color: ColorTable.color48_53_159,
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                  width: 103.76),
            ),
            Text(
              loginState.when(
                initial: () => str,
                loading: () => str,
                data: (data) => 'Medlegten app ${(data as Version).appVersion}',
                error: (error) => str,
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(130, 130, 130, 1),
                  fontFamily: 'Poppins-Light',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w300,
                  height: 1),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            )
          ],
        ),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize(WidgetRef ref) async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    dioRepository.setDioOptions();
    dioRepository.setToken(
        'T0rr2flSZvRRwkZJMFMPLGttmZLDJS2pIfTg2yvYMiJNy5OXNptODn28TiJ1tZeV');

    ref.read(loginNotifierProvider.notifier).getAppVersion();

    var token = await GetStorage().read('token') ?? '';

    //if (token == '') {
    //  await ref.read(authProvider.notifier).loginFacebook();
    //}

    await Future.delayed(const Duration(seconds: 1));
  }
}

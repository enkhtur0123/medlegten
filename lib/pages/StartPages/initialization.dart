import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Starting/version.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'medlegten_vertical.dart';

class InitializationPage extends HookWidget {
  const InitializationPage({Key? key}) : super(key: key);

  Future<Version?> fetchData() async {
    return await LoginRepository().getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    //final loginState = ref.watch(loginNotifierProvider);

    var str = 'Medlegten app v1.0';
    //loginState.whenOrNull(
    //   data: (data) {
    //     if (data is Version) {
    //       str = 'Medlegten app ${data.appVersion}';
    //     }
    //   },
    // );
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

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
              snapshot.hasData
                  ? 'Medlegten app ${snapshot.data!.appVersion}'
                  : str,
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
    ref.read(loginNotifierProvider.notifier).getAppVersion();

    ref.read(authProvider.notifier).login();
  }
}

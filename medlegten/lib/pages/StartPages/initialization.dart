import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

import 'medlegten_vertical.dart';

class InitializationPage extends StatelessWidget {
  const InitializationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Medlegten app V1',
              textAlign: TextAlign.center,
              style: TextStyle(
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

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 1));
  }
}

import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';

class AgePage extends StatelessWidget {
  const AgePage({Key? key}) : super(key: key);
  //      await LoginRepository().fetchLoginInfo(fbuser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              'Та төрсөн он сар өдрөө оруулна уу! ---.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorTable.color48_53_159,
                  fontFamily: 'Roboto-Bold',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1),
            ),
          ),
          Flexible(
            flex: 2,
            child: WideButton(
              "Continue",
              ColorTable.color120_100_254,
              ColorTable.color255_255_255,
              () {
                //AutoRouter.of(context).push(const LoginRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}

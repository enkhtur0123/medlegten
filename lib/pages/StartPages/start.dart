import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/loader.dart';

import 'medlegten_vertical.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo/backround.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const MedlegtenLogoVertical(
                        TextStyle(
                            color: Color.fromRGBO(48, 53, 159, 1),
                            fontFamily: 'Roboto-Bold',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1),
                        text: 'LEARN FOREIGN LANGUAGES',
                        width: 83.52),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'in Entertaining Ways',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(48, 53, 159, 1),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          height: 1),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      WideButton("Нэвтрэх", ColorTable.color120_100_254,
                          ColorTable.color255_255_255, () {
                        AutoRouter.of(context).push(const LoginRoute());
                      }),
                      const Spacer(
                        flex: 1,
                      ),
                      WideButton(
                          "Lingos гэж юу вэ?",
                          ColorTable.color255_255_255,
                          ColorTable.color120_100_254, () async {
                        showLoading(context: context, isLoad: true);
                        LoginRepository().getOnboardingInfo().then((value) {
                          showLoading(context: context, isLoad: false);
                          AutoRouter.of(context)
                              .push(OnboardingRoute(onboardingList: value!));
                        }).catchError((onError) {
                          showLoading(context: context, isLoad: false);
                        });
                      }),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  showLoading({bool? isLoad, BuildContext? context}) {
    if (isLoad!) {
      LoadingIndicator(context: context).showLoadingIndicator();
    } else {
      LoadingIndicator(context: context).hideLoadingIndicator();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/img/Logo.png',
                    width: 38.1, height: 100, fit: BoxFit.fitWidth),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'MEDLEGTEN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorTable.color48_53_159,
                      fontFamily: 'Poppins-SemiBold',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorTable.color255_255_255,
                        primary: Colors.black87,
                        fixedSize: const Size(31, 24),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorTable.color120_100_254,
                            fontFamily: 'Roboto-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assets/img/Logo.png',
                      width: 400, height: 400, fit: BoxFit.contain),
                  Text(
                    'Cue Builder',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: ColorTable.color120_100_254,
                        fontFamily: 'Roboto-Regular',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        width: 200,
                        height: 100,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum porta ipsum',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: ColorTable.color120_100_254,
                              fontFamily: 'Roboto-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: TextButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(40.0, 40.0)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorTable.color120_100_254),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            onPressed: null,
                            child: const Icon(Icons.chevron_right,
                                color: Colors.white, size: 20.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

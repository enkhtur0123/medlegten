import 'package:flutter/material.dart';
import 'package:medlegten/common/widget_functions.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          addVerticalSpace(10),
          const Text('Түр хүлээнэ үү', style: TextStyle(color: Colors.black))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorText;
  const CustomError(this.errorText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(errorText, style: const TextStyle(color: Colors.red))],
      ),
    );
  }
}

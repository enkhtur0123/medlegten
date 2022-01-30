import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.labelText,
      this.enabled = true,
      this.onChanged,
      this.isBordered = true})
      : super(key: key);

  TextEditingController? controller;
  bool? enabled;
  FocusNode? focusNode;
  bool isBordered;
  TextInputType? keyboardType;
  String? labelText;
  Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      showCursor: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        enabled: enabled!,
        filled: true,
        labelText: labelText,
        border: isBordered
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Color(0xff7864FE)),
              )
            : UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xff7864FE),
                ),
              ),
        labelStyle: const TextStyle(color: Color(0xFF424242)),
        disabledBorder: isBordered
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Color(0xff7864FE)))
            : UnderlineInputBorder(),
      ),
      onChanged: (value) {
        onChanged!(value);
      },
    );
  }
}

// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.labelText,
      this.enabled = true,
      this.onChanged,
      this.isBordered = true,
      this.suffix,
      this.labelColor,
      this.filled,
      this.onSubmitted,
      this.validator,
      this.errorText,
      this.formKey,
      this.borderColor})
      : super(key: key);

  TextEditingController? controller;
  bool? enabled;
  FocusNode? focusNode;
  bool isBordered;
  TextInputType? keyboardType;
  String? labelText;
  Function? onChanged;
  Widget? suffix;
  Color? labelColor;
  bool? filled;
  Function? onSubmitted;
  String? Function(String?)? validator;
  String? errorText;
  var formKey;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      showCursor: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        errorText: errorText,
        enabled: enabled!,
        filled: filled ?? false,
        labelText: labelText,
        suffix: suffix ?? Container(),
        iconColor: Colors.white,
        border: isBordered
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 1, color: borderColor ?? const Color(0xff7864FE)),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
        labelStyle: TextStyle(color: labelColor ?? const Color(0xFF424242)),
        disabledBorder: isBordered
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 1, color: borderColor ?? const Color(0xff7864FE)))
            : const UnderlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: isBordered
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1,
                  color: borderColor ?? const Color(0xff7864FE),
                ),
              )
            : const UnderlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: (value) {
        onChanged!(value);
      },
      onFieldSubmitted: (value) {
        onSubmitted!(value);
      },
    );
  }
}

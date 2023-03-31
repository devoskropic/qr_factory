import 'package:flutter/material.dart';

class CustomTextFormField {
  TextFormField cusTextFormField({
    String? labelText,
    String? hintText,
    Function(String)? onChanged,
    required bool validate,
  }) {
    return TextFormField(
      autofocus: false,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (validate == false) {
          return null;
        } else if (value!.isEmpty) {
          return 'campo requerido';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hintText,
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
}

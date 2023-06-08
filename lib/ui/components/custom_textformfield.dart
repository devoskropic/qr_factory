import 'package:flutter/material.dart';

class CustomTextFormField {
  TextFormField requiredFormField({
    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    required bool isRequired,
    required bool autofocus,
    required TextInputAction textInputAction,
  }) {
    return TextFormField(
      autofocus: autofocus,
      textInputAction: textInputAction,
      validator: (value) {
        if (isRequired == false) {
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

  TextFormField validatorFormField({
    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    required bool autofocus,
    required TextInputAction textInputAction,
  }) {
    return TextFormField(
      autofocus: autofocus,
      textInputAction: textInputAction,
      validator: validator,
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

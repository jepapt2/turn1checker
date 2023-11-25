import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryTextField extends FormBuilderTextField {
  PrimaryTextField({
    Key? key,
    required String name,
    InputDecoration? decoration,
    String? Function(String?)? validator,
    String? initialValue,
    int? maxLength,
  }) : super(
          style: const TextStyle(color: ColorTheme.white, fontSize: 20.0),
          cursorColor: ColorTheme.white,
          key: key,
          name: name,
          decoration: decoration ?? const InputDecoration(),
          validator: validator,
          initialValue: initialValue,
          maxLength: maxLength,
        );
}

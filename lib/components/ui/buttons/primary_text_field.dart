import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PrimaryTextField extends HookWidget {
  PrimaryTextField({
    Key? key,
    required this.name,
    this.decoration,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.onChanged,
  }) : super(
          key: key,
        );

  final String name;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLength;
  final void Function(String?)? onChanged;
  final TextEditingController controller = useTextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: validator,
      decoration: decoration ?? const InputDecoration(),
      initialValue: initialValue,
      maxLength: maxLength,
      onChanged: onChanged,
      controller: controller,
    );
  }
}

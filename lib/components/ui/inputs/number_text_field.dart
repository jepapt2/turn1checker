import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:turn1checker/components/ui/inputs/primary_text_field.dart';

class NumberTextField extends HookWidget {
  NumberTextField({
    Key? key,
    required this.name,
    this.label,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.onChanged,
    this.placeholder,
  }) : super(
          key: key,
        );

  final String name;
  final String? label;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLength;
  final void Function(int)? onChanged;
  final String? placeholder;
  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      name: name,
      label: label,
      validator: validator,
      maxLength: maxLength,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      onChanged: (value) {
        final onChangedCall = onChanged;
        if (onChangedCall != null) {
          final intValue = int.tryParse(value ?? '') ?? 0 * 1;
          onChangedCall(intValue);
        }
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      placeholder: placeholder,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    required this.name,
    this.label,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.onChanged,
    this.keyboardType,
    this.placeholder,
    this.controller,
    this.inputFormatters,
    this.textDirection,
    this.textAlign = TextAlign.start,
  }) : super(
          key: key,
        );

  final String name;
  final String? label;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLength;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final String? placeholder;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label ?? '',
            style: const TextStyle(color: ColorTheme.white, fontSize: 16),
          ),
          const SizedBox(height: 2)
        ],
        FormBuilderTextField(
          key: key,
          textAlign: textAlign,
          textDirection: textDirection,
          controller: controller,
          name: name,
          validator: validator,
          initialValue: initialValue,
          decoration: InputDecoration(hintText: placeholder, counterText: ''),
          maxLength: maxLength,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: const TextStyle(color: ColorTheme.black),
          inputFormatters: inputFormatters,
        )
      ],
    );
  }
}

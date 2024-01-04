import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryTextField extends StatelessWidget {
  PrimaryTextField({
    Key? key,
    required this.name,
    this.label,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.onChanged,
  }) : super(
          key: key,
        );

  final String name;
  final String? label;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLength;
  final void Function(String?)? onChanged;
  final TextEditingController controller = TextEditingController(text: '');

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
          name: name,
          validator: validator,
          initialValue: initialValue,
          maxLength: maxLength,
          onChanged: onChanged,
          controller: controller,
          style: const TextStyle(color: ColorTheme.black),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryDropDown<T> extends StatelessWidget {
  const PrimaryDropDown({
    Key? key,
    required this.name,
    required this.items,
    this.onChanged,
    this.label,
    this.initialValue,
  }) : super(
          key: key,
        );

  final String name;
  final List<DropdownMenuItem<T>> items;
  final String? label;
  final void Function(T)? onChanged;
  final T? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (label != null) ...[
        Text(
          label ?? '',
          style: const TextStyle(color: ColorTheme.white, fontSize: 16),
        ),
        const SizedBox(height: 2),
      ],
      FormBuilderDropdown(
          initialValue: initialValue,
          dropdownColor: ColorTheme.white,
          style: const TextStyle(color: ColorTheme.black),
          name: name,
          items: items,
          onChanged: (value) {
            if (value != null && onChanged != null) {
              onChanged!(value);
            }
          },
          icon: const Icon(
            Icons.arrow_drop_down,
            color: ColorTheme.black,
          )),
    ]);
  }
}
